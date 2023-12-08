import requests
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# The base URL for the API
base_url = 'http://127.0.0.1:5000'

# The endpoint for retrieving all tables
endpoint = '/table/all'

# Load the API key from an environment variable
api_key = os.getenv("SECRET_KEY")

# Make sure API_KEY is present
if not api_key:
    raise ValueError("Please set the API_KEY environment variable in your .env file")

# Construct the full URL
url = f"{base_url}{endpoint}"

# Add the API key as a query parameter
params = {
    'api_key': api_key
}

# Make the GET request to the API
response = requests.get(url, params=params)

# Check if the request was successful
if response.status_code == 200:
    # Parse the response JSON and print the result
    tables = response.json()
    print("Tables:", tables)
else:
    print("Failed to retrieve tables. Status code:", response.status_code)
    print("Response:", response.text)

# Make sure to handle exceptions such as ConnectionError in a try-except block
