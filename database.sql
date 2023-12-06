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



