-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE travelers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE city_country
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL 
);




CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  traveler INT REFERENCES travelers,
  airline INT REFERENCES airline,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city INT NOT NULL REFERENCES city_country,
  from_country INT,
  to_city INT REFERENCES city_country,
  to_country INT 
);






INSERT INTO travelers
(first_name, last_name)
VALUES
 ('Jennifer', 'Finch'),
 ('Thadeus', 'Gathercoal'),
 ('Sonja', 'Pauley'),
 ('Jennifer', 'Finch'),
 ('Waneta', 'Skeleton'),
 ('Thadeus', 'Gathercoal'),
 ('Berkie', 'Wycliff'),
 ('Alvin', 'Leathes'),
 ('Berkie', 'Wycliff'),
 ('Cory', 'Squibbes');

 INSERT INTO airline
 (name)
 VALUES
 ('United'),
 ('British Airways'),
 ('Delta'),
 ('TUI Fly Belgium'),
 ('Air China'),
 ('American Airlines'),
 ('Avianca Brasil');

INSERT INTO city_country
(city, country)
VALUES
('Washington DC', 'United States'),
('Tokyo', 'Japan'),
('Los Angeles', 'United States'),
('Seattle', 'United States'),
('Paris', 'France'),
('Dubai', 'UAE'),
('New York', 'United States'),
('Cedar Rapids', 'United States'),
('Charlotte','United States'),
('Sao Paolo', 'Brazil'),
('London', 'United Kingdom'),
('Las Vegas', 'United States'),
('Mexico City', 'Mexico'),
('Casablanca', 'Morocco'),
('Beijing', 'China'),
('Chicago', 'United States'),
('New Orleans', 'United States'),
('Santiago', 'Chile');

INSERT INTO tickets
  (traveler, airline, seat, departure, arrival, from_city, to_city)
VALUES
  (1,1,'33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 4),
  (2,2,'8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00',  2, 11),
  (3,3,'12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00',  3, 12),
  (4,3,'20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00',  4, 13),
  (5,4,'23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00',  5, 14),
  (6,5,'18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00',  6, 15),
  (7,1,'9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 9),
  (8,6,'1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00',  8, 16),
  (9,6,'32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00',  9, 17),
  (10,7,'10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00',  10, 18);