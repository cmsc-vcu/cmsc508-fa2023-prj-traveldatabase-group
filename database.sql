SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Agency;
DROP TABLE IF EXISTS Agent;
DROP TABLE IF EXISTS Trip;
DROP TABLE IF EXISTS Package;
DROP TABLE IF EXISTS Traveler;
DROP TABLE IF EXISTS Destination;
DROP TABLE IF EXISTS Travel;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Transaction;

SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE Agency (
    Agency_ID int not null,
    Agency_name varchar(256) not null,
    Agency_location varchar(256) not null,
    Contact_info varchar(256) not null,
    Primary KEY (Agency_ID)
);


INSERT INTO Agency (Agency_ID, Agency_name, Agency_location, Contact_info)
VALUES
(1, 'Global Adventures', '123 Adventure Lane, Seattle', 'contact@globaladventures.com'),
(2, 'Sunset Travels', '456 Sunset Blvd, Miami', 'info@sunsettravels.com'),
(3, 'Mountain High Tours', '789 Peak St, Denver', 'support@mountainhightours.com'),
(4, 'City Escape', '1010 Urban Ave, New York', 'hello@cityescape.com'),
(5, 'Beachfront Journeys', '1212 Ocean Drive, Los Angeles', 'service@beachfrontjourneys.com'),
(6, 'Heritage Voyages', '1313 History Rd, Boston', 'contact@heritagevoyages.com'),
(7, 'Nature Trails', '1414 Forest Path, Portland', 'info@naturetrails.com'),
(8, 'Winter Wonder Tours', '1515 Snow Ave, Minneapolis', 'support@winterwondertours.com'),
(9, 'Desert Discoveries', '1616 Dune Ct, Phoenix', 'hello@desertdiscoveries.com'),
(10, 'Safari Quest', '1717 Safari Ln, Nairobi', 'service@safariquest.com');


CREATE TABLE Agent (
    Agent_ID int not null,
    Agent_first_name varchar(256) not null,
    Agent_last_name varchar(256) not null,
    Agent_email varchar(256) not null,
    Agent_phone varchar(256) not null,
    Experience_years float,
    Specialization varchar(256),
    Primary KEY (Agent_ID)
);


INSERT INTO Agent (Agent_ID, Agent_first_name, Agent_last_name, Agent_email, Agent_phone, Experience_years, Specialization)
VALUES
(1, 'John', 'Doe', 'johndoe@email.com', '123-456-7890', 5, 'Adventure'),
(2, 'Jane', 'Smith', 'janesmith@email.com', '123-456-7891', 3, 'Beach'),
(3, 'Emily', 'Johnson', 'emilyjohnson@email.com', '123-456-7892', 8, 'Cultural'),
(4, 'Mike', 'Brown', 'mikebrown@email.com', '123-456-7893', 10, 'Eco-Tourism'),
(5, 'Sarah', 'Davis', 'sarahdavis@email.com', '123-456-7894', 7, 'Luxury'),
(6, 'Chris', 'Miller', 'chrismiller@email.com', '123-456-7895', 6, 'Safari'),
(7, 'Anna', 'Wilson', 'annawilson@email.com', '123-456-7896', 4, 'Urban Exploration'),
(8, 'David', 'Moore', 'davidmoore@email.com', '123-456-7897', 9, 'Mountain Trekking'),
(9, 'Laura', 'Taylor', 'laurataylor@email.com', '123-456-7898', 2, 'Historical Tours'),
(10, 'James', 'Anderson', 'jamesanderson@email.com', '123-456-7899', 11, 'Wildlife');


CREATE TABLE Trip (
    Trip_ID int not null,
    Booking_date date not null,
    Trip_start_date date not null,
    Trip_end_date date not null,
    Primary KEY (Trip_ID)
);


INSERT INTO Trip (Trip_ID, Booking_date, Trip_start_date, Trip_end_date)
VALUES
(1, '2023-01-01', '2023-06-10', '2023-06-20'),
(2, '2023-01-15', '2023-07-05', '2023-07-15'),
(3, '2023-02-01', '2023-08-15', '2023-08-25'),
(4, '2023-02-20', '2023-09-01', '2023-09-10'),
(5, '2023-03-10', '2023-10-20', '2023-10-30'),
(6, '2023-03-25', '2023-11-05', '2023-11-15'),
(7, '2023-04-10', '2023-12-10', '2023-12-20'),
(8, '2023-04-25', '2024-01-15', '2024-01-25'),
(9, '2023-05-10', '2024-02-05', '2024-02-15'),
(10, '2023-05-25', '2024-03-10', '2024-03-20');


CREATE TABLE Package (
    Package_ID int not null,
    Package_name varchar(256),
    Total_cost float not null,
    Duration int not null,
    Package_description varchar(256),
    Primary Key (Package_ID)
);


INSERT INTO Package (Package_ID, Package_name, Total_cost, Duration, Package_description)
VALUES
(1, 'Adventure Seeker', 1500.00, 7, 'A thrilling adventure package for adrenaline seekers'),
(2, 'Beach Relaxation', 1200.00, 5, 'A relaxing beach holiday with sun and sand'),
(3, 'Cultural Explorer', 1800.00, 10, 'An immersive experience into local culture and history'),
(4, 'Eco Paradise', 2000.00, 8, 'An eco-friendly tour focused on sustainability and nature'),
(5, 'Luxury Getaway', 2500.00, 7, 'A luxurious and pampering retreat for ultimate relaxation'),
(6, 'Safari Adventure', 2200.00, 9, 'An exciting safari trip through the wilderness'),
(7, 'Urban Discovery', 1300.00, 6, 'Exploring the heart of major cities and their hidden gems'),
(8, 'Mountain Trek', 1600.00, 7, 'A challenging and rewarding mountain trekking experience'),
(9, 'Historical Journey', 1700.00, 8, 'A journey through time to explore historical landmarks'),
(10, 'Wildlife Encounter', 1900.00, 9, 'An opportunity to get close to exotic wildlife in their natural habitat');


CREATE TABLE Traveler (
    Traveler_ID int not null,
    Traveler_first_name varchar(256) not null,
    Traveler_last_name varchar(256) not null,
    Date_of_birth date not null,
    Traveler_email varchar(256) not null,
    Traveler_phone varchar(256) not null,
    Traveler_address varchar(256) not null,
    Budget float not null,
    Primary KEY (Traveler_ID)
);


INSERT INTO Traveler (Traveler_ID, Traveler_first_name, Traveler_last_name, Date_of_birth, Traveler_email, Traveler_phone, Traveler_address, Budget)
VALUES
(1, 'Alice', 'Hamilton', '1985-04-23', 'alice@email.com', '234-567-8901', '1010 Maple St, Toronto', 3000.00),
(2, 'Bob', 'Johnson', '1990-07-16', 'bob@email.com', '234-567-8902', '2020 Oak Ave, London', 2500.00),
(3, 'Clara', 'Lee', '1978-11-02', 'clara@email.com', '234-567-8903', '3030 Birch Ln, Sydney', 3500.00),
(4, 'David', 'Smith', '1982-02-14', 'david@email.com', '234-567-8904', '4040 Cedar Blvd, New York', 4000.00),
(5, 'Eva', 'Martinez', '1995-05-28', 'eva@email.com', '234-567-8905', '5050 Pine Rd, Madrid', 2800.00),
(6, 'Frank', 'Brown', '1988-09-30', 'frank@email.com', '234-567-8906', '6060 Spruce St, Berlin', 3200.00),
(7, 'Grace', 'Wilson', '1992-12-15', 'grace@email.com', '234-567-8907', '7070 Fir Ln, Paris', 2600.00),
(8, 'Harry', 'Davis', '1975-06-08', 'harry@email.com', '234-567-8908', '8080 Elm St, Tokyo', 3800.00),
(9, 'Ivy', 'Garcia', '1984-03-22', 'ivy@email.com', '234-567-8909', '9090 Aspen Rd, Beijing', 3400.00),
(10, 'Jack', 'Miller', '1993-01-10', 'jack@email.com', '234-567-8910', '1010 Redwood Ave, San Francisco', 2900.00);


CREATE TABLE Destination (
    Destination_ID int not null,
    Destination_name varchar(256) not null,
    Country varchar(256) not null,
    City varchar(256) not null,
    Destination_description varchar(256),
    Popular_attractions varchar(256),
    Average_cost float not null,
    Primary KEY (Destination_ID)
);

INSERT INTO Destination (Destination_ID, Destination_name, Country, City, Destination_description, Popular_attractions, Average_cost)
VALUES
(1, 'Grand Canyon', 'USA', 'Arizona', 'A breathtaking natural wonder', 'Hiking, Sightseeing', 500.00),
(2, 'Eiffel Tower', 'France', 'Paris', 'Iconic French landmark', 'Sightseeing, Dining', 600.00),
(3, 'Great Barrier Reef', 'Australia', 'Queensland', 'Largest coral reef system', 'Snorkeling, Diving', 700.00),
(4, 'Taj Mahal', 'India', 'Agra', 'A symbol of love', 'Sightseeing, Photography', 400.00),
(5, 'Safari Park', 'Kenya', 'Nairobi', 'Wildlife in natural habitat', 'Safari, Wildlife Watching', 800.00),
(6, 'Great Wall of China', 'China', 'Beijing', 'Historic fortification', 'Hiking, History Tours', 450.00),
(7, 'Machu Picchu', 'Peru', 'Cusco', 'Ancient Incan city', 'Hiking, Archaeological Tours', 550.00),
(8, 'Venice Canals', 'Italy', 'Venice', 'Famous waterways and architecture', 'Boating, Sightseeing', 600.00),
(9, 'Yellowstone National Park', 'USA', 'Wyoming', 'First national park with geothermal features', 'Hiking, Wildlife Viewing', 350.00),
(10, 'Pyramids of Giza', 'Egypt', 'Cairo', 'Ancient Egyptian pyramids', 'History Tours, Photography', 500.00);


CREATE TABLE Travel (
    Travel_ID int not null,
    Travel_method varchar(256) not null,
    Departure_location varchar(256) not null,
    Arrival_location varchar(256) not null,
    Arrival_date date not null,
    Cost float not null,
    Travel_provider varchar(256),
    Primary KEY (Travel_ID)
);

INSERT INTO Travel (Travel_ID, Travel_method, Departure_location, Arrival_location, Arrival_date, Cost, Travel_provider)
VALUES
(1, 'Flight', 'New York', 'London', '2023-06-10', 1000.00, 'Sky Airlines'),
(2, 'Train', 'Paris', 'Berlin', '2023-07-05', 150.00, 'EuroRail'),
(3, 'Bus', 'Los Angeles', 'San Francisco', '2023-08-15', 50.00, 'Pacific Coaches'),
(4, 'Cruise', 'Miami', 'Bahamas', '2023-09-01', 500.00, 'Ocean Voyages'),
(5, 'Flight', 'Sydney', 'Tokyo', '2023-10-20', 1200.00, 'Southern Cross Air'),
(6, 'Train', 'Moscow', 'St. Petersburg', '2023-11-05', 100.00, 'Trans-Siberian Rail'),
(7, 'Bus', 'Toronto', 'Montreal', '2023-12-10', 80.00, 'Maple Line'),
(8, 'Cruise', 'Cape Town', 'Madagascar', '2024-01-15', 700.00, 'African Sea Adventures'),
(9, 'Flight', 'Dubai', 'Paris', '2024-02-05', 950.00, 'Gulf Wings'),
(10, 'Train', 'Beijing', 'Shanghai', '2024-03-10', 130.00, 'Dragon Express');


CREATE TABLE Payment (
    Payment_ID int not null,
    Amount float not null,
    Payment_date date not null,
    Payment_method varchar(256) not null,
    Primary KEY (Payment_ID)
);

INSERT INTO Payment (Payment_ID, Amount, Payment_date, Payment_method)
VALUES
(1, 1500.00, '2023-01-01', 'Credit Card'),
(2, 1200.00, '2023-01-15', 'PayPal'),
(3, 1800.00, '2023-02-01', 'Debit Card'),
(4, 2000.00, '2023-02-20', 'Bank Transfer'),
(5, 2500.00, '2023-03-10', 'Credit Card'),
(6, 2200.00, '2023-03-25', 'PayPal'),
(7, 1300.00, '2023-04-10', 'Debit Card'),
(8, 1600.00, '2023-04-25', 'Bank Transfer'),
(9, 1700.00, '2023-05-10', 'Credit Card'),
(10, 1900.00, '2023-05-25', 'PayPal');


CREATE TABLE Transaction (
    Transaction_ID INT PRIMARY KEY,
    Traveler_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Status VARCHAR(10),
    Payment_Method VARCHAR(20)
);

INSERT INTO Transaction (Transaction_ID, Traveler_ID, Amount, Payment_Status, Payment_Method)
VALUES 
    (1, 101, 500.00, 'Paid', 'Credit Card'),
    (2, 102, 700.00, 'Paid', 'PayPal'),
    (3, 103, 450.00, 'Pending', 'Bank Transfer'),
    (4, 104, 600.00, 'Paid', 'Debit Card'),
    (5, 105, 850.00, 'Paid', 'Cash'),
    (6, 106, 550.00, 'Pending', 'Credit Card'),
    (7, 107, 750.00, 'Paid', 'PayPal'),
    (8, 108, 400.00, 'Pending', 'Bank Transfer'),
    (9, 109, 680.00, 'Paid', 'Debit Card'),
    (10, 110, 900.00, 'Paid', 'Credit Card');


CREATE TABLE Review (
    Review_ID INT PRIMARY KEY,
    Travel_ID INT,
    Traveler_ID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review_Text TEXT
);


INSERT INTO Review (Review_ID, Travel_ID, Traveler_ID, Rating, Review_Text)
VALUES 
    (1, 1, 101, 4, 'Enjoyed the trek, stunning views!'),
    (2, 2, 102, 5, 'Fascinating history, excellent tour guide!'),
    (3, 3, 103, 3, 'Beautiful beaches, but hotel service could improve'),
    (4, 4, 104, 4, 'Loved exploring the city, great food recommendations'),
    (5, 5, 105, 5, 'Amazing wildlife experience, knowledgeable guides'),
    (6, 6, 106, 4, 'Serene mountain retreat, cozy accommodations'),
    (7, 7, 107, 2, 'Disappointing stay, cleanliness issues'),
    (8, 8, 108, 5, 'Rich history, friendly locals'),
    (9, 9, 109, 4, 'Thrilling desert adventure, great cultural insights'),
    (10, 10, 110, 3, 'Beautiful islands, but crowded during peak season');


CREATE TABLE Hotel (
    Hotel_ID INT PRIMARY KEY,
    Hotel_Name VARCHAR(50),
    Destination VARCHAR(50),
    Cost_Per_Night DECIMAL(10, 2),
    Rating DECIMAL(2, 1) CHECK (Rating BETWEEN 1.0 AND 5.0)
);

INSERT INTO Hotel (Hotel_ID, Hotel_Name, Destination, Cost_Per_Night, Rating)
VALUES 
    (101, 'Mountain View Lodge', 'Himalayas', 100.00, 4.5),
    (102, 'Roma Historical Hotel', 'Rome, Italy', 150.00, 4.8),
    (103, 'Bali Beach Resort', 'Bali, Indonesia', 120.00, 3.9),
    (104, 'Urban Escape Hotel', 'New York, USA', 200.00, 4.2),
    (105, 'Safari Camp Retreat', 'Serengeti, Africa', 180.00, 4.7),
    (106, 'Alpine Chalet', 'Swiss Alps', 130.00, 4.6),
    (107, 'Maldives Paradise', 'Maldives', 300.00, 4.9),
    (108, 'Acropolis View Hotel', 'Athens, Greece', 160.00, 4.4),
    (109, 'Desert Oasis Resort', 'Dubai, UAE', 220.00, 4.3),
    (110, 'Phuket Beachfront', 'Phuket, Thailand', 90.00, 4.0);


