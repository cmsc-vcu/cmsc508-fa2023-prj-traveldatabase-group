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
DROP TABLE IF EXISTS Hotels;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE Agency (
    Agency_ID int not null,
    Agency_name varchar(256) not null,
    Agency_location varchar(256) not null,
    Contact_info varchar(256) not null,
    Primary KEY (Agency_ID)
);

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

CREATE TABLE Trip (
    Trip_ID int not null,
    Booking_date date not null,
    Trip_start_date date not null,
    Trip_end_date date not null,
    Primary KEY (Trip_ID)
);

CREATE TABLE Package (
    Package_ID int not null,
    Package_name varchar(256),
    Total_cost float not null,
    Duration int not null,
    Package_description varchar(256),
    Primary Key (Package_ID)
);

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

CREATE TABLE Payment (
    Payment_ID int not null,
    Amount float not null,
    Payment_date date not null,
    Payment_method varchar(256) not null,
    Primary KEY (Payment_ID)
);

CREATE TABLE Review (
    Review_ID int not null,
    Rating float not null,
    Feed_back varchar(256) not null,
    Primary KEY (Review_ID)
);

CREATE TABLE Hotels (
    Hotel_ID int not null,
    Hotel_name varchar(256) not null,
    Hotel_address varchar(256) not null,
    Cost_per_night float not null,
    Amentities varchar(256),
    Primary KEY (Hotel_ID)
);
-- Sample Data
-- Billing and Payment
CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Tourist_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Status VARCHAR(10),
    Payment_Method VARCHAR(20)
);

INSERT INTO Transactions (Transaction_ID, Tourist_ID, Amount, Payment_Status, Payment_Method)
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

-- Package Tours
CREATE TABLE Tours (
    Tour_ID INT PRIMARY KEY,
    Tour_Name VARCHAR(50),
    Destination VARCHAR(50),
    Start_Date DATE,
    End_Date DATE,
    Cost_Per_Person DECIMAL(10, 2)
);

INSERT INTO Tours (Tour_ID, Tour_Name, Destination, Start_Date, End_Date, Cost_Per_Person)
VALUES 
    (1, 'Adventure Trek', 'Himalayas', '2023-05-15', '2023-05-22', 800.00),
    (2, 'Cultural Heritage', 'Rome, Italy', '2023-06-10', '2023-06-18', 1200.00),
    (3, 'Beach Paradise', 'Bali, Indonesia', '2023-07-05', '2023-07-12', 1000.00),
    (4, 'City Explorer', 'New York, USA', '2023-08-20', '2023-08-27', 1500.00),
    (5, 'Wildlife Safari', 'Serengeti, Africa', '2023-09-15', '2023-09-22', 1300.00),
    (6, 'Alpine Retreat', 'Swiss Alps', '2023-10-10', '2023-10-18', 1100.00),
    (7, 'Tropical Getaway', 'Maldives', '2023-11-05', '2023-11-12', 1800.00),
    (8, 'Historic City Tour', 'Athens, Greece', '2023-12-01', '2023-12-09', 1400.00),
    (9, 'Desert Adventure', 'Dubai, UAE', '2024-01-15', '2024-01-22', 1600.00),
    (10, 'Island Hopping', 'Phuket, Thailand', '2024-02-10', '2024-02-18', 900.00);

-- Reviews and Ratings
CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Tour_ID INT,
    Tourist_ID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Review_Text TEXT
);

INSERT INTO Reviews (Review_ID, Tour_ID, Tourist_ID, Rating, Review_Text)
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

--Accommodation Management
CREATE TABLE Hotels (
    Hotel_ID INT PRIMARY KEY,
    Hotel_Name VARCHAR(50),
    Destination VARCHAR(50),
    Cost_Per_Night DECIMAL(10, 2),
    Rating DECIMAL(2, 1) CHECK (Rating BETWEEN 1.0 AND 5.0)
);

INSERT INTO Hotels (Hotel_ID, Hotel_Name, Destination, Cost_Per_Night, Rating)
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


