-- SQL Basics Tutorial

-- 1. Write a query that returns all of the customer names from the orders table.

SELECT customer_name FROM orders;

-- 2. Write a query that returns all of the orders that include a Chocolate Shake.

SELECT * FROM orders WHERE drink = 'Chocolate Shake';

-- 3. Write a query that returns the burger, side, and drink for the order with an id of 2.

SELECT burger, side, drink FROM orders WHERE id = 2;

-- 4. Write a query that returns the name of anyone who ordered Onion Rings.

SELECT customer_name
FROM orders
WHERE side = 'Onion Rings';

-- Create and View Databases 

-- 1. From the Terminal, create a database called database_one.

$ createdb database_one

-- 2. From the Terminal, connect via the psql console to the database that you created in the previous question.

$ psql -d database_one

-- 3. From the psql console, create a database called database_two.

CREATE DATABASE database_two;

-- 4. From the psql console, connect to database_two.

\c database_two

-- 5. Display all of the databases that currently exist.

\l

-- 6. From the psql console, delete database_two.

\c database_one
DROP DATABASE database_two;

-- 7. From the Terminal, delete the database_one and ls_burger databases.

\q
dropdb database_one
dropdb ls_burger

-- Create and View Tables

-- 1. From the Terminal, create a database called encyclopedia and connect to it via the psql console.

$ createdb encyclopedia
$ psql -d encyclopedia

-- 2. Create a table called countries. It should have the following columns:

      -- An id column of type serial
      -- A name column of type varchar(50)
      -- A capital column of type varchar(50)
      -- A population column of type integer

      -- The name column should have a UNIQUE constraint. The name and capital columns should both have NOT NULL constraints.

CREATE TABLE countries (
  id serial,
  name varchar(50) UNIQUE NOT NULL,
  capital varchar(50) NOT NULL,
  population integer
);

-- 3. Create a table called famous_people. It should have the following columns:

      -- An id column that contains auto-incrementing values
      -- A name column. This should contain a string up to 100 characters in length
      -- An occupation column. This should contain a string up to 150 characters in length
      -- A date_of_birth column that should contain each person's date of birth in a string of up to 50 characters
      -- A deceased column that contains either true or false
      -- The table should prevent NULL values being added to the name column. If the value of the deceased column is absent or unknown then false should be used.

CREATE TABLE famous_people (
  id serial,
  name varchar(100) NOT NULL,
  occupation varchar(150),
  date_of_birth varchar(50),
  deceased boolean DEFAULT false
);

-- 4. Create a table called animals that could contain the sample data below:

      -- | Name | Binomial Name | Max Weight (kg) | Max Age (years) | Conservation Status |
      -- | --- | --- | --- | --- | --- |
      -- | Lion | Pantera leo | 250 | 20 | VU |
      -- | Killer Whale | Orcinus orca | 6,000 | 60 | DD |
      -- | Golden Eagle | Aquila chrysaetos | 6.35 | 24 | LC |
      -- The database table should also contain an auto-incrementing id column.
      -- Each animal should always have a name and a binomial name.
      -- Names and binomial names vary in length but never exceed 100 characters.
      -- The max weight column should be able to hold data in the range 0.001kg to 40,000kg
      -- Conservation Status is denoted by a combination of two letters (CR, EN, VU, etc).

CREATE TABLE animals (
  id serial,
  name text NOT NULL,
  binomial_name text NOT NULL,
  max_weight_kg decimal(8, 3),
  max_age_years integer,
  conservation_status char(2)
);

-- 5. List all of the tables in the encyclopedia database.

\dt 

-- 6. Display the schema for the animals table.

\d animals

-- 7. Create a database called ls_burger and connect to it.

CREATE DATABASE ls_burger;
\c ls_burger

-- 8. Create a table in the ls_burger database called orders. The table should have the following columns:

      -- An id column, that should contain an auto-incrementing integer value.
      -- A customer_name column, that should contain a string of up to 100 characters
      -- A burger column, that should hold a string of up to 50 characters
      -- A side column, that should hold a string of up to 50 characters
      -- A drink column, that should hold a string of up to 50 characters
      -- An order_total column, that should hold a numeric value in dollars and cents. Assume that all orders will be less than $100.
      -- The customer_name and order_total columns should always contain a value.

CREATE TABLE orders (
  id serial,
  customer_name varchar(100) NOT NULL,
  burger varchar(50),
  side varchar(50),
  drink varchar(50),
  order_total decimal(4,2) NOT NULL
);

-- Alter a Table

-- 1. Make sure you are connected to the encyclopedia database. Rename the famous_people table to celebrities.

\c encyclopedia
ALTER TABLE famous_people RENAME TO celebrities;

-- 2. Change the name of the name column in the celebrities table to first_name, and change its data type to varchar(80).

ALTER TABLE celebrities RENAME COLUMN name TO first_name;
ALTER TABLE celebrities ALTER COLUMN first_name TYPE varchar(80);

-- 3. Create a new column in the celebrities table called last_name. It should be able to hold strings of lengths up to 100 characters. This column should always hold a value.

ALTER TABLE celebrities
ADD COLUMN last_name varchar(100) NOT NULL;

-- 4. Change the celebrities table so that the date_of_birth column uses a data type that holds an actual date value rather than a string. Also ensure that this column must hold a value.

ALTER TABLE celebrities
ALTER COLUMN date_of_birth TYPE date
  USING date_of_birth::date,
ALTER COLUMN date_of_birth SET NOT NULL;

-- 5. Change the max_weight_kg column in the animals table so that it can hold values in the range 0.0001kg to 200,000kg

ALTER TABLE animals
ALTER COLUMN max_weight_kg
TYPE decimal(10,4);

-- 6. Change the animals table so that the binomial_name column cannot contain duplicate values.

ALTER TABLE animals
ADD CONSTRAINT unique_binominal_names UNIQUE(binomial_name);

-- 7. Connect to the ls_burger database. Add the following columns to the orders table:

      -- A column called customer_email; it should hold strings of up to 50 characters.
      -- A column called customer_loyalty_points that should hold integer values. If no value is specified for this column, then a value of 0 should be applied.

\c ls_burger
ALTER TABLE orders
ADD COLUMN customer_email varchar(50),
ADD COLUMN customer_loyalty_points integer DEFAULT 0;

-- 8. Add three columns to the orders table called burger_cost, side_cost, and drink_cost to hold monetary values in dollars and cents (assume that all values will be less than $100). If no value is entered for these columns, a value of 0 dollars should be used.

ALTER TABLE orders
ADD COLUMN burger_cost decimal(4,2) DEFAULT 0,
ADD COLUMN side_cost decimal(4,2) DEFAULT 0,
ADD COLUMN drink_cost decimal(4,2) DEFAULT 0;

-- 9. Remove the order_total column from the orders table.

ALTER TABLE orders
DROP COLUMN order_total;

-- Inserting Data into a Table

-- 1. Make sure you are connected to the encyclopedia database. Add the following data to the countries table:

      -- Name	    Capital	  Population
      -- France	  Paris	    67,158,000

INSERT INTO countries (name, capital, population)
VALUES ('France', 'Paris', 67158000);

-- 2. Now add the following additional data to the countries table:

      -- USA	    Washington D.C.	  325,365,189
      -- Germany	Berlin	          82,349,400
      -- Japan	  Tokyo	            126,672,000

INSERT INTO countries (name, capital, population)
VALUES 
('USA', 'Washington D.C.', 325365189),
('Germany',	'Berlin', 82349400),
('Japan', 'Tokyo', 126672000);

-- 3. Add an entry to the celebrities table for the singer and songwriter Bruce Springsteen, who was born on September 23rd 1949 and is still alive.

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Bruce', 'Springsteen', 'Singer, Songwritier', '1949-09-23', false);

-- 4. Add an entry for the actress Scarlett Johansson, who was born on November 22nd 1984. Use the default value for the deceased column.

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES ('Scarlett', 'Johansson', 'Actress', '1984-11-22', DEFAULT);

-- 5. Add the following two entries to the celebrities table with a single INSERT statement. For Frank Sinatra set true as the value for the deceased column. For Tom Cruise, don't set an explicit value for the deceased column, but use the default value.

      -- First Name	  Last Name	  Occupation	    D.O.B.
      -- Frank	      Sinatra	    Singer, Actor	  December 12, 1915
      -- Tom	        Cruise	    Actor	          July 03, 1962

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES
('Frank', 'Sinatra', 'Singer, Actor', '1915-12-12', true),
('Tom', 'Criuse', 'Actor', '1962-07-03', DEFAULT);

-- 6. Look at the schema of the celebrities table. What do you think will happen if we try to insert the following data?

-- First Name	 Last Name	 Occupation	                          D.O.B.	      Deceased
-- Madonna		             Singer, Actress	                    '08/16/1958'	false
-- Prince		               Singer, Songwriter, Musician, Actor	'06/07/1958'	true

ERROR:  null value in column "last_name" of relation "celebrities" violates not-null constraint

-- 7. Update the last_name column of the celebrities table so that the data in the previous question can be entered, and then add the data to the table.

ALTER TABLE celebrities
ALTER COLUMN last_name
DROP NOT NULL;

INSERT INTO celebrities (first_name, occupation, date_of_birth, deceased)
VALUES
('Madonna', 'Singer, Actress', '1958-08-16', false),
('Prince', 'Singer, Songwriter, Musician, Actor', '1958-06-07', true);

OR 

INSERT INTO celebrities (first_name, last_name, occupation, date_of_birth, deceased)
VALUES
('Madonna', NULL, 'Singer, Actress', '1958-08-16', false),
('Prince', NULL, 'Singer, Songwriter, Musician, Actor', '1958-06-07', true);

-- 8. Check the schema of the celebrities table. What would happen if we specify a NULL value for deceased column, such as with the data below?

-- First Name	Last Name	Occupation	            D.O.B.	      Deceased
-- Elvis	    Presley	  Singer, Musician, Actor	'01/08/1935'	NULL


-- 9. Check the schema of the animals table. What would happen if we tried to insert the following data to the table?

-- Name	            Binomial Name	            Max Weight (kg)	Max Age (years) Conservation Status
-- Dove	            Columbidae Columbiformes	2	              15	            LC
-- Golden Eagle	    Aquila Chrysaetos	        6.35	          24	            LC
-- Peregrine Falcon	Falco Peregrinus	        1.5	            15	            LC
-- Pigeon	          Columbidae Columbiformes	2	              15	            LC
-- Kakapo	          Strigops habroptila	      4	              60	            CR

-- Identify the problem and alter the table so that the data can be entered as shown, and then insert the data.

ERROR:  duplicate key value violates unique constraint "unique_binominal_names"
DETAIL:  Key (binomial_name)=(Columbidae Columbiformes) already exists.

ALTER TABLE animals DROP CONSTRAINT unique_binominal_names;

INSERT INTO animals (name, binomial_name, max_weight_kg, max_age_years, conservation_status)
VALUES
('Dove', 'Columbidae Columbiformes', 2, 15, 'LC'),
('Golden Eagle', 'Aquila Chrysaetos', 6.35,	24, 'LC'),
('Peregrine Falcon', 'Falco Peregrinus', 1.5, 15, 'LC'),
('Pigeon', 'Columbidae Columbiformes',	2, 15, 'LC'),
('Kakapo', 'Strigops habroptila', 4, 60, 'CR');

-- 10. Connect to the ls_burger database and examine the schema for the orders table.

-- Based on the table schema and following information, write and execute an INSERT statement to add the appropriate data to the orders table.

-- There are three customers -- James Bergman, Natasha O'Shea, Aaron Muller. James' email address is james1998@email.com. Natasha's email address is natasha@osheafamily.com. Aaron doesn't supply an email address.

-- James orders a LS Chicken Burger, Fries and a Cola. Natasha has two orders -- an LS Cheeseburger with Fries but no drink, and an LS Double Deluxe Burger with Onion Rings and a Chocolate Shake. Aaron orders an LS Burger with no side or drink.

-- The item costs and loyalty points are listed below:

-- Item	                    Cost ($)	Loyalty Points
-- LS Burger	              3.00	    10
-- LS Cheeseburger	        3.50	    15
-- LS Chicken Burger	      4.50	    20
-- LS Double Deluxe Burger	6.00	    30
-- Fries	                  0.99	    3
-- Onion Rings	            1.50	    5
-- Cola	                    1.50	    5
-- Lemonade	                1.50	    5
-- Vanilla Shake	          2.00	    7
-- Chocolate Shake	        2.00	    7
-- Strawberry Shake	        2.00	    7

INSERT INTO orders (customer_name, customer_email, burger, burger_cost, side, side_cost, drink, drink_cost, customer_loyalty_points)
VALUES
('James Bergman', 'james1998@email', 'LS Chicken Burger', 4.50, 'Fries', 0.99, 'Cola', 1.50, 28), 
('Natasha O''Shea', 'natasha@osheafamily.com', 'LS Cheeseburger', 3.50, 'Fries', 0.99, NULL, DEFAULT, 18),
('Natasha O''Shea', 'natasha@osheafamily.com', 'LS Double Deluxe Burger', 6.00, 'Onion Rings', 1.50, 'Chocolate Shake', 2.00, 42),
('Aaron Muller', NULL, 'LS Burger', 3, NULL, DEFAULT, NULL, DEFAULT, 10);

-- Select Queries

-- 1. Make sure you are connected to the encyclopedia database. Write a query to retrieve the population of the USA.

SELECT population FROM countries
WHERE name = 'USA';

-- 2. Write a query to return the population and the capital (with the columns in that order) of all the countries in the table.

SELECT population, capital
FROM countries;

-- 3. Write a query to return the names of all the countries ordered alphabetically.

SELECT name
FROM countries
ORDER BY name;

-- 4. Write a query to return the names and the capitals of all the countries in order of population, from lowest to highest.

SELECT name, capital
FROM countries
ORDER BY population;

-- 5. Write a query to return the same information as the previous query, but ordered from highest to lowest.

SELECT name, capital
FROM countries
ORDER BY population DESC;

-- 6. Write a query on the animals table, using ORDER BY, that will return the following output:

--        name       |      binomial_name       | max_weight_kg | max_age_years
-- ------------------+--------------------------+---------------+---------------
--  Peregrine Falcon | Falco Peregrinus         |        1.5000 |            15
--  Pigeon           | Columbidae Columbiformes |        2.0000 |            15
--  Dove             | Columbidae Columbiformes |        2.0000 |            15
--  Golden Eagle     | Aquila Chrysaetos        |        6.3500 |            24
--  Kakapo           | Strigops habroptila      |        4.0000 |            60
-- (5 rows)

-- Use only the columns that can be seen in the above output for ordering purposes.

SELECT name, binomial_name, max_weight_kg, max_age_years FROM animals
ORDER BY max_age_years, max_weight_kg, name DESC;

-- 7. Write a query that returns the names of all the countries with a population greater than 70 million.

SELECT name FROM countries
WHERE population > 70000000;

-- 8. Write a query that returns the names of all the countries with a population greater than 70 million but less than 200 million.

SELECT name FROM countries
WHERE population  > 70000000 AND population < 200000000;

-- 9. Write a query that will return the first name and last name of all entries in the celebrities table where the value of the deceased column is not true.

SELECT first_name, last_name
FROM celebrities
WHERE deceased != true OR deceased IS NULL;

-- 10. Write a query that will return the first and last names of all the celebrities who sing.

SELECT first_name, last_name
FROM celebrities
WHERE occupation LIKE '%Sing%';

-- 11. Write a query that will return the first and last names of all the celebrities who act.

SELECT first_name, last_name
FROM celebrities
WHERE occupation LIKE '%Act%';

-- 12. Write a query that will return the first and last names of all the celebrities who both sing and act.

SELECT first_name, last_name
FROM celebrities
WHERE occupation LIKE '%Act%' AND occupation LIKE '%Sing%';

-- 13. Connect to the ls_burger database. Write a query that lists all of the burgers that have been ordered, from cheapest to most expensive, where the cost of the burger is less than $5.00.

SELECT burger
FROM orders
WHERE burger_cost < 5
ORDER BY burger_cost;

-- 14. Write a query to return the customer name and email address and loyalty points from any order worth 20 or more loyalty points. List the results from the highest number of points to the lowest.

SELECT customer_name, customer_email, customer_loyalty_points
FROM orders
WHERE customer_loyalty_points >= 20
ORDER BY customer_loyalty_points DESC;

-- 15. Write a query that returns all the burgers ordered by Natasha O'Shea.

SELECT burger
FROM orders
WHERE customer_name = 'Natasha O''Shea';

-- 16. Write a query that returns the customer name from any order which does not include a drink item.

SELECT customer_name
FROM orders
WHERE drink IS NULL;

-- 17. Write a query that returns the three meal items for any order which does not include fries.

SELECT burger, side, drink
FROM orders
WHERE side != 'Fries' OR side IS NULL;

-- 18. Write a query that returns the three meal items for any order that includes both a side and a drink.

SELECT burger, side, drink
FROM orders
WHERE side IS NOT NULL AND drink IS NOT NULL;

-- More on Select

-- 1. Make sure you are connected to the encyclopedia database. Write a query to retrieve the first row of data from the countries table.

SELECT * FROM countries
LIMIT 1;

-- 2. Write a query to retrieve the name of the country with the largest population.

SELECT name FROM countries
ORDER BY population DESC
LIMIT 1;

-- 3. Write a query to retrieve the name of the country with the second largest population.

SELECT name FROM countries
ORDER BY population DESC
LIMIT 1 OFFSET 1;

-- 4. Write a query to retrieve all of the unique values from the binomial_name column of the animals table.

SELECT DISTINCT binomial_name FROM animals;

-- 5. Write a query to return the longest binomial name from the animals table.

SELECT binomial_name FROM animals
ORDER BY length(binomial_name) DESC
LIMIT 1;

-- 6. Write a query to return the first name of any celebrity born in 1958.

SELECT first_name FROM celebrities
WHERE date_part('year', date_of_birth) = 1958;

-- 7. Write a query to return the highest maximum age from the animals table.

SELECT max(max_age_years) FROM animals;

-- 8. Write a query to return the average maximum weight from the animals table.

SELECT avg(max_weight_kg) FROM animals;

-- 9. Write a query to return the number of rows in the countries table.

SELECT count(id) FROM countries;

-- 10. Write a query to return the total population of all the countries in the countries table.

SELECT sum(population) FROM countries;

-- 11. Write a query to return each unique conservation status code alongside the number of animals that have that code.

SELECT DISTINCT conservation_status, count(id) FROM animals
GROUP BY conservation_status;

-- 12. Connect to the ls_burger database. Write a query that returns the average burger cost for all orders that include fries.

\c ls_burger
SELECT avg(burger_cost) FROM orders
WHERE side = 'Fries';

-- 13. Write a query that returns the cost of the cheapest side ordered.

SELECT min(side_cost) FROM orders
WHERE SIDE IS NOT NULL;

OR 

SELECT side_cost FROM orders
WHERE side IS NOT NULL
ORDER BY side_cost
LIMIT 1;

-- 14. Write a query that returns the number of orders that include Fries and the number of orders that include Onion Rings.

SELECT side, count(id) FROM orders
WHERE side = 'Fries' OR side = 'Onion Rings'
GROUP BY side;

-- Update Data in a Table

-- 1. Make sure you are connected to the encyclopedia database. Add a column to the animals table called class to hold strings of up to 100 characters.

-- Update all the rows in the table so that this column holds the value Aves.

ALTER TABLE animals
ADD COLUMN class varchar(100);

UPDATE animals
SET class = 'Aves';

-- 2. Add two more columns to the animals table called phylum and kingdom. Both should hold strings of up to 100 characters.

-- Update all the rows in the table so that phylum holds the value Chordata and kingdom holds Animalia for all the rows in the table.

ALTER TABLE animals
ADD COLUMN phylum varchar(100),
ADD COLUMN kingdom varchar(100);

UPDATE animals
SET phylum = 'Chordata', kingdom = 'Animalia';

-- 3. Add a column to the countries table called continent to hold strings of up to 50 characters.

-- Update all the rows in the table so France and Germany have a value of Europe for this column, Japan has a value of Asia and the USA has a value of North America.

ALTER TABLE countries
ADD COLUMN continent varchar(50);

UPDATE countries
SET continent = 'Europe' WHERE name = 'France' OR name = 'Germany';

UPDATE countries
SET continent = 'Asia' WHERE name = 'Japan';

UPDATE countries
SET continent = 'North America' WHERE name = 'USA';

-- 4. In the celebrities table, update the Elvis row so that the value in the deceased column is true. Then change the column so that it no longer allows NULL values.

UPDATE celebrities
SET deceased = true
WHERE first_name = 'Elvis';

ALTER TABLE celebrities
ALTER COLUMN deceased SET NOT NULL;

-- 5. Remove Tom Cruise from the celebrities table.

DELETE FROM celebrities
WHERE first_name = 'Tom' AND last_name = 'Cruise';

-- 6. Change the name of the celebrities table to singers, and remove anyone who isn't a singer.

ALTER TABLE celebrities
RENAME TO singers;

DELETE FROM singers
WHERE occupation NOT LIKE '%Sing%';

-- 7. Remove all the rows from the countries table.

DELETE FROM countries;

-- 8. Connect to the ls_burger database. Change the drink on James Bergman's order from a Cola to a Lemonade.

\c ls_burger

UPDATE orders
SET drink = 'Lemonade'
WHERE id = 1;

-- 9. Add Fries to Aaron Muller's order. Make sure to add the cost ($0.99) to the appropriate field and add 3 loyalty points to the current total.

UPDATE orders
SET side = 'Fries', customer_loyalty_points = 13, side_cost = 0.99
WHERE id = 4;

-- 10. The cost of Fries has increased to $1.20. Update the data in the table to reflect this.

UPDATE orders
SET side_cost = 1.20
WHERE side = 'Fries';

-- Table Relationships

-- 1. Make sure you are connected to the encyclopedia database. We want to hold the continent data in a separate table from the country data.

  -- 1a. Create a continents table with an auto-incrementing id column (set as the Primary Key), and a continent_name column which can hold the same data as the continent column from the countries table.

  CREATE TABLE continents (
    id serial PRIMARY KEY,
    continent_name varchar(50)
  );

  -- 1b. Remove the continent column from the countries table.

  ALTER TABLE countries
    DROP COLUMN continent;

  -- 1c. Add a continent_id column to the countries table of type integer.

  ALTER TABLE countries
    ADD COLUMN continent_id integer;

  -- 1d. Add a Foreign Key constraint to the continent_id column which references the id field of the continents table.

  ALTER TABLE countries
    ADD FOREIGN KEY (continent_id) 
    REFERENCES continents(id);

-- 2. Write statements to add data to the countries and continents tables so that the data below is correctly represented across the two tables. Add both the countries and the continents to their respective tables in alphabetical order.

INSERT INTO continents (continent_name)
VALUES
('Africa'),
('Asia'),
('Europe'),
('North America'),
('South America');

INSERT INTO countries (name, capital, population, continent_id)
VALUES
('France', 'Paris', 67158000, 3),
('USA', 'Washington D.C.', 325365189, 4),
('Germany', 'Berlin', 82349400, 3),
('Japan', 'Tokyo',  126672000, 2),
('Egypt', 'Cairo',  96308900, 1),
('Brazil', 'Brasilia', 208385000, 5);

-- 3. Examine the data below:

-- We want to create an albums table to hold all the above data except the singer name, and create a reference from the albums table to the singers table to link each album to the correct singer. Write the necessary SQL statements to do this and to populate the table with data. Assume Album Name, Genre, and Label can hold strings up to 100 characters. Include an auto-incrementing id column in the albums table.

CREATE TABLE albums (
id serial PRIMARY KEY,
album_name varchar(100),
released date,
genre varchar(100),
label varchar(100),
singer_id integer,
FOREIGN KEY (singer_id) REFERENCES singers(id)
);

ALTER TABLE singers
ADD CONSTRAINT unique_id UNIQUE (id);

-- 4. Connect to the ls_burger database. If you run a simple SELECT query to retrieve all the data from the orders table, you will see it is very unnormalised. We have repetition of item names and costs and of customer data.

-- SELECT * FROM orders;
--  id | customer_name  |         burger          |    side     |      drink      |     customer_email      | customer_loyalty_points | burger_cost | side_cost | drink_cost
-- ----+----------------+-------------------------+-------------+-----------------+-------------------------+-------------------------+-------------+-----------+------------
--   3 | Natasha O'Shea | LS Double Deluxe Burger | Onion Rings | Chocolate Shake | natasha@osheafamily.com |                      42 |        6.00 |      1.50 |       2.00
--   2 | Natasha O'Shea | LS Cheeseburger         | Fries       |                 | natasha@osheafamily.com |                      18 |        3.50 |      1.20 |       0.00
--   1 | James Bergman  | LS Chicken Burger       | Fries       | Lemonade        | james1998@email.com     |                      28 |        4.50 |      1.20 |       1.50
--   4 | Aaron Muller   | LS Burger               | Fries       |                 |                         |                      13 |        3.00 |      1.20 |       0.00
-- (4 rows)

-- We want to break this table up into multiple tables. First of all create a customers table to hold the customer name data and an email_addresses table to hold the customer email data. Create a one-to-one relationship between them, ensuring that if a customer record is deleted so is the equivalent email address record. Populate the tables with the appropriate data from the current orders table.

CREATE TABLE customers (
id serial PRIMARY KEY,
customer_name varchar(100)
);

CREATE TABLE email_addresses (
customer_id integer PRIMARY KEY,
customer_email varchar(50),
FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE
);

INSERT INTO customers (customer_name)
VALUES
('James Bergman'),
('Natasha O''Shea'),
('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email)
VALUES
(1, 'james1998@email.com'),
(2, 'natasha@osheafamily.com'),
(3, NULL);


-- 5. We want to make our ordering system more flexible, so that customers can order any combination of burgers, sides and drinks. The first step towards doing this is to put all our product data into a separate table called products. Create a table and populate it with the following data:

-- Product Name	            Product Cost	Product Type	Product Loyalty Points
-- LS Burger	              3.00	        Burger	      10
-- LS Cheeseburger	        3.50	        Burger	      15
-- LS Chicken Burger	      4.50	        Burger	      20
-- LS Double Deluxe Burger	6.00	        Burger	      30
-- Fries	                  1.20	        Side	        3
-- Onion Rings	            1.50	        Side	        5
-- Cola	                    1.50	        Drink	        5
-- Lemonade	                1.50	        Drink	        5
-- Vanilla Shake	          2.00	        Drink	        7
-- Chocolate Shake	        2.00	        Drink	        7
-- Strawberry Shake	        2.00	        Drink	        7

-- The table should also have an auto-incrementing id column which acts as its PRIMARY KEY. The product_type column should hold strings of up to 20 characters. Other than that, the column types should be the same as their equivalent columns from the orders table.

CREATE TABLE products (
  id serial PRIMARY KEY,
  product_name varchar(50),
  product_cost numeric(4,2) DEFAULT 0,
  product_type varchar(20),
  product_loyalty_points integer DEFAULT 0
);

INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points)
VALUES ('LS Burger', 3.00, 'Burger', 10 ),
('LS Cheeseburger', 3.50, 'Burger', 15 ),
('LS Chicken Burger', 4.50, 'Burger', 20 ),
('LS Double Deluxe Burger', 6.00, 'Burger', 30 ),
('Fries', 1.20, 'Side', 3 ),
('Onion Rings', 1.50, 'Side', 5 ),
('Cola', 1.50, 'Drink', 5 ),
('Lemonade', 1.50, 'Drink', 5 ),
('Vanilla Shake', 2.00, 'Drink', 7 ),
('Chocolate Shake', 2.00, 'Drink', 7 ),
('Strawberry Shake', 2.00, 'Drink', 7);

-- 6. To associate customers with products, we need to do two more things:

      -- 6a. Alter or replace the orders table so that we can associate a customer with one or more orders (we also want to record an order status in this table).

      DROP TABLE orders;

      CREATE TABLE orders (
        id serial PRIMARY KEY,
        customer_id integer,
        order_status varchar(20),
        FOREIGN KEY (customer_id) REFERENCES customers(id)
        ON DELETE CASCADE
      );

      -- 6b. Create an order_items table so that an order can have one or more products associated with it.

      CREATE TABLE order_items (
        id serial PRIMARY KEY,
        order_id integer NOT NULL,
        product_id integer NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders (id)
        ON DELETE CASCADE,
        FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE
      );

-- Based on the order descriptions below, amend and create the tables as necessary and populate them with the appropriate data.

-- James has one order, consisting of a Chicken Burger, Fries, Onion Rings, and a Lemonade. It has a status of 'In Progress'.

-- Natasha has two orders. The first consists of a Cheeseburger, Fries, and a Cola, and has a status of 'Placed'; the second consists of a Double Deluxe Burger, a Cheeseburger, two sets of Fries, Onion Rings, a Chocolate Shake and a Vanilla Shake, and has a status of 'Complete'.

-- Aaron has one order, consisting of an LS Burger and Fries. It has a status of 'Placed'.

-- Assume that the order_status field of the orders table can hold strings of up to 20 characters.

INSERT INTO orders (customer_id, order_status)
VALUES
(1, 'In Progress'),
(2, 'Placed'),
(2, 'Complete'),
(3, 'Placed');

INSERT INTO order_items (order_id, product_id)
VALUES
(1, 3), (1, 5), (1, 6), (1, 8),
(2, 2), (2, 5), (2, 7),
(3, 2), (3, 4), (3, 5), (3, 5), (3, 6), (3, 9), (3, 10),
(4, 1), (4,  5);

-- SQL Joins

-- 1. Connect to the encyclopedia database. Write a query to return all of the country names along with their appropriate continent names.

SELECT countries.name, continents.continent_name
FROM countries INNER JOIN continents
ON countries.continent_id = continents.id;

-- 2. Write a query to return all of the names and capitals of the European countries.

SELECT countries.name, countries.capital
FROM countries JOIN continents
ON countries.continent_id = continents.id
WHERE continents.continent_name = 'Europe';

-- 3. Write a query to return the first name of any singer who had an album released under the Warner Bros label.

SELECT DISTINCT singers.first_name
FROM singers JOIN albums
ON singers.id = albums.singer_id
WHERE albums.label LIKE '%Warner Bros%';

-- 4. Write a query to return the first name and last name of any singer who released an album in the 80s and who is still living, along with the names of the album that was released and the release date. Order the results by the singer's age (youngest first).

SELECT singers.first_name, singers.last_name, albums.album_name, albums.released
FROM singers JOIN albums 
ON singers.id = albums.singer_id
WHERE albums.released >= '1980-01-01' AND albums.released < '1990-01-01' AND singers.deceased = false
ORDER BY singers.date_of_birth DESC;

-- 5. Write a query to return the first name and last name of any singer without an associated album entry.

SELECT singers.first_name, singers.last_name
FROM singers LEFT JOIN albums
ON singers.id = albums.singer_id
WHERE albums.id IS NULL;

-- 6. Rewrite the query for the last question as a sub-query.

SELECT first_name, last_name FROM singers
WHERE id NOT IN (SELECT singer_id FROM albums);

-- 7. Connect to the ls_burger database. Return a list of all orders and their associated product items.

SELECT orders.*, products.*
FROM order_items 
JOIN orders ON order_items.order_id = orders.id
JOIN products ON order_items.product_id = products.id;

-- 8. Return the id of any order that includes Fries. Use table aliasing in your query.

SELECT o.id
FROM orders AS o
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE p.product_name = 'Fries';

-- 9. Build on the query from the previous question to return the name of any customer who ordered fries. Return this in a column called 'Customers who like Fries'. Don't repeat the same customer name more than once in the results.

SELECT DISTINCT c.customer_name AS "Customers who like Fries"
FROM customers AS c
JOIN orders AS o ON c.id = o.customer_id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE p.product_name = 'Fries';

-- 10. Write a query to return the total cost of Natasha O'Shea's orders.

SELECT sum(p.product_cost) AS "Total Order Cost"
FROM products AS p
JOIN order_items AS oi ON p.id = oi.product_id
JOIN orders AS o ON oi.order_id = o.id
JOIN customers AS c ON o.customer_id = c.id
WHERE c.customer_name = 'Natasha O''Shea';

customers: id customer_name
order_items: id order_id product_id
orders: id customer_id order_status
products: id product_name product_cost product_type product_loyalty_points

-- 11. Write a query to return the name of every product included in an order alongside the number of times it has been ordered. Sort the results by product name, ascending.

SELECT p.product_name AS "Product", count(oi.product_id) AS "Number of Times Ordered"
FROM products AS p
JOIN order_items AS oi ON p.id = oi.product_id
GROUP BY p.product_name
ORDER BY p.product_name;
