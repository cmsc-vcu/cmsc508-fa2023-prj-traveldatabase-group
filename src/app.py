from flask import Flask, jsonify, request
import os
import sys
import pandas as pd
from tabulate import tabulate
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
from functools import wraps


config_map = {
    'user':'CMSC508_USER',
    'password':'CMSC508_PASSWORD',
    'host':'CMSC508_HOST',
    'database':'GROUP_DB_NAME'
}
# load and store credentials
load_dotenv()
config = {}
for key in config_map.keys():
    config[key] = os.getenv(config_map[key])
flag = False
for param in config.keys():
    if config[param] is None:
        flag = True
        print(f"Missing {config_map[param]} in .env file")

# build a sqlalchemy engine string
engine_uri = f"mysql+pymysql://{config['user']}:{config['password']}@{config['host']}/{config['database']}"

# create a database connection.  THIS IS THE ACTUAL CONNECTION!
try:
    conn = create_engine(engine_uri)
except ArgumentError as e:
    print(f"create_engine: Argument Error: {e}")
    #sys.exit(1)
except NoSuchModuleError as e:
    print(f"create_engine: No Such Module Error: {e}")
    #sys.exit(1)
except Exception as e:
    print(f"create_engine: An error occurred: {e}")
    #sys.exit(1)

def my_sql_wrapper(query, params=None):
    """Executes a SQL query safely using parameters."""
    try:
        df = pd.read_sql(query, conn, params=params)
    except Exception as e:
        df = pd.DataFrame({'Query error': ["(see error message above)"]})
        msg = str(e).replace(") (",")\n(")
        print(msg)
    return df

def my_sql_statement( statement ):
    """ used with DDL, when the statement doesn't return any results. """
    try:
        with conn.begin() as x:
            x.execute(text(statement))
            x.commit()
    #    conn = create_engine(engine_uri)
        result = ""
    except Exception as e:
        result = f"Error: {str(e)}"
#    conn = create_engine(engine_uri)
    return result

app = Flask(__name__)

API_KEY = os.getenv("SECRET_KEY")

def is_valid_table(name):
    """Checks if the given table name is valid."""
    valid_tables = pd.read_sql("SHOW TABLES", conn)
    return name in valid_tables.values

def require_api_key(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        input_key = request.args.get('api_key') or request.form.get('api_key')
        if input_key != API_KEY:
            return jsonify({'Error': 'Unauthorized'}), 401
        return f(*args, **kwargs)
    return decorated_function

@app.route("/table/all")
@require_api_key
def table_all():
    df = my_sql_wrapper("SHOW TABLES")
    response = df.to_dict(orient='records')
    return jsonify(response)

@app.route("/table/<name>")
@require_api_key
def table_retriever(name=None):
    if not is_valid_table(name):
        return jsonify("Error: Invalid table name!"), 400

    query = text(f"SELECT * FROM {name}")
    df = my_sql_wrapper(query)
    response = df.to_dict(orient='records')
    return jsonify(response)

@app.route("/table/<name>/<ids>")
@require_api_key
def id_retriever(name, ids):
    if not is_valid_table(name):
        return jsonify("Error: Invalid table name!"), 400

    try:
        id_list = [int(id_str) for id_str in ids.split(',')]
    except ValueError:
        return jsonify("Error: IDs must be integers"), 400

    query = text(f"SELECT * FROM {name} WHERE {name}_ID IN :id_list")
    df = my_sql_wrapper(query, params={"id_list": tuple(id_list)})
    response = df.to_dict(orient='records')
    return jsonify(response)

@app.route("/table/<name>/", methods=['GET'])
@require_api_key
def attribute_retriever(name):
    if not is_valid_table(name):
        return jsonify("Error: Invalid table name!"), 400

    # Initialize the base query
    query = f"SELECT * FROM {name}"
    params = {}

    # Check if there are query parameters for filtering
    query_parameters = request.args
    if query_parameters:
        filters = []
        for key, value in query_parameters.items():
            # Exclude 'api_key' from SQL query parameters
            if key != 'api_key':
                filters.append(f"{key} = :{key}")
                params[key] = value

        if filters:
            query += " WHERE " + " AND ".join(filters)
        else:
            # Handle the case where no relevant query parameters are provided
            return jsonify("Error: No relevant query parameters provided!"), 400
    else:
        # Handle the case where no query parameters are provided
        return jsonify("Error: No query parameters provided!"), 400

    # Execute the query
    df = my_sql_wrapper(text(query), params)
    response = df.to_dict(orient='records')
    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True)
