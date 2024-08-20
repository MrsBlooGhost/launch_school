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
