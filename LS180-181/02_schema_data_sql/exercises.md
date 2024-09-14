# Lesson 02: Schema, Data, and SQL

## Topic 02: The SQL Language

> What kind of programming language is SQL?

SQL is a special purpose language, whose purpose is to interact with relational databases.

> What are the three sublanguages of SQL?

1. Data definition language (DDL), which controls a relation's structure and rules with `CREATE`, `DROP`, and `ALTER`.
2. Data manipulation language (DML), which controls the data stored in a relation using `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.
3. Data control language (DCL), which controls accessibility and permissions of certain users, using `GRANT` and `REVOKE`.

> Write the following values as quoted string values that could be used in a SQL query.
> ```
> canoe
> a long road
> weren't
> "No way!"
> ```
```sql
'canoe'
'a long road'
'weren''t'
'"No way!"'
```

> What operator is used to concatenate strings?

`||`

> What function returns a lowercased version of a string? Write a SQL statement using it.

`lower()`

```sql
SELECT lower('AbC');
```

> How does the `psql` console display true and false values?

`t` and `f`

> The surface area of a sphere is calculated using the formula `A = 4πr^2`, where `A` is the surface area and `r` is the radius of the sphere. Use SQL to compute the surface area of a sphere with a radius of 26.3cm, truncated to return an integer.

```sql
SELECT trunc(4 * pi() * 26.3^2);
```

## Topic 05: PostgreSQL Data Types
> Describe the difference between the `varchar` and `text` data types.

`varchar` allows columns to store text up to a limited length of characters whereas `text` allows columns to store an unlimited length of text.

> Describe the difference between the `integer`, `decimal`, and `real` data types.

`integer` allows columns to store whole numbers. 
`real` allows columns to store floating-point numbers. 
`decimal` allows columns to store floating- and non-floating-point numbers of a specific precision and scale. 

> What is the largest value that can be stored in an integer column?

2147483647

> Describe the difference between the `timestamp` and `date` data types.

`timestamp` allows columns to include both a time of day and date, where as `date` data types allow columns to include only the date. 

> Can a time with a time zone be stored in a column of type `timestamp`?

No. There's a specific data type, `timestamp with time zone`, or `timestamptz`, that should be used to store a time with a time zone in a column.

## Topic 06: Working with a Single Table

> Write a SQL statement that will create the following table, people:

```sql
CREATE TABLE people (
  name text,
  age integer,
  occupation text
  );
```

> Write SQL statements to insert the data shown in #1 into the table.

```sql
INSERT INTO people (name, age, occupation)
VALUES
('Abby', 34, 'biologist'),
('Mu''nisah', 26, NULL),
('Mirabelle', 40, 'contractor');
```

> Write 3 SQL queries that can be used to retrieve the second row of the table shown in #1 and #2.

```sql
SELECT * FROM people
WHERE name = 'Mu''nisah';

SELECT * FROM people
WHERE age = 26;

SELECT * FROM people
WHERE occupation IS NULL;
```

> Write a SQL statement that will create a table named birds that can hold the following values:

```sql
CREATE TABLE birds (
name varchar(255),
length decimal(4,1),
wingspan decimal (4,1),
family varchar(255),
extinct boolean
);
```

> Using the table created in #4, write the SQL statements to insert the data as shown in the listing.

```sql
INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES
('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
('American Robin', 25.5, 36.0, 'Turdidae', false),
('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
('Common Kestrel', 35.5, 73.5, 'Falconidae', false);
```

> Write a SQL statement that finds the names and families for all birds that are not extinct, in order from longest to shortest (based on the length column's value).

```sql
SELECT name, family
FROM birds
WHERE extinct = false
ORDER BY length DESC;
```

> Use SQL to determine the average, minimum, and maximum wingspan for the birds shown in the table.

```sql
SELECT round(avg(wingspan), 1), min(wingspan), max(wingspan) FROM birds;
```

> Write a SQL statement to create the table shown below, menu_items:

```sql
CREATE TABLE menu_items (
  item varchar(255),
  prep_time integer,
  ingredient_cost decimal(4,2),
  sales integer,
  menu_price decimal(4,2)
);
```

> Write SQL statements to insert the data shown in #8 into the table.

```sql
INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price)
VALUES
('omelette', 10, 1.50, 182, 7.99),
('tacos', 5, 2.00, 254, 8.99),
('oatmeal', 1, 0.50, 79, 5.99);
```

> Using the table and data from #8 and #9, write a SQL query to determine which menu item is the most profitable based on the cost of its ingredients, returning the name of the item and its profit.

```sql
SELECT item, menu_price - ingredient_cost AS profit FROM menu_items
ORDER BY profit DESC
LIMIT 1;
```

> Write a SQL query to determine how profitable each item on the menu is based on the amount of time it takes to prepare one item. Assume that whoever is preparing the food is being paid $13 an hour. List the most profitable items first. Keep in mind that `prep_time` is represented in minutes and `ingredient_cost` and `menu_price` are both in dollars and cents:

```sql
SELECT item, menu_price, ingredient_cost, 
       round(prep_time / 60.0 * 13, 2) AS labor,
       menu_price - ingredient_cost - round(prep_time / 60.0 * 13, 2) AS profit 
  FROM menu_items
  ORDER BY profit DESC;
```

## Topic 07: Loading Database Dumps

> a. What does the file do?

> b. What is the output of the command? What does each line in this output mean?

> c. Open up the file and look at its contents. What does the first line do?

This file contains SQL statements. The statements drop a "films" table, if it exists, then creates a new table, and inserts 3 rows of data into it. 

```sql
NOTICE:  table "films" does not exist, skipping
DROP TABLE -- A "films" table doesn't exist, so no table is dropped
CREATE TABLE -- A new table is created
INSERT 0 1 -- A row of data has been inserted into the table
INSERT 0 1 -- A row of data has been inserted into the table
INSERT 0 1 -- A row of data has been inserted into the table
```

The first line, `DROP TABLE IF EXISTS public.films;`, removes a table "films" if it exists.

> Write a SQL statement that returns all rows in the **films** table.

```sql
SELECT * 
  FROM films;
```

> Write a SQL statement that returns all rows in the **films** table with a title shorter than 12 letters.

```sql
SELECT * 
  FROM films
  WHERE length(title) < 12;
```

> Write the SQL statements needed to add two additional columns to the **films** table: `director`, which will hold a director's full name, and `duration`, which will hold the length of the film in minutes.

```sql
ALTER TABLE films
  ADD COLUMN director varchar(255),
  ADD COLUMN duration integer;
```

> Write SQL statements to update the existing rows in the database with values for the new columns:

```sql
UPDATE films
  SET director = 'John McTiernan', duration = 132 WHERE title = 'Die Hard';

UPDATE films
  SET director = 'Michael Curtiz', duration = 102 WHERE title = 'Casablanca';

UPDATE films
  SET director = 'Francis Ford Coppola', duration = 113 WHERE title = 'The Conversation';
```

> Write SQL statements to insert the following data into the **films** table:

```sql
INSERT INTO films (title, "year", genre, director, duration)
  VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
         ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
         ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);
```

> Write a SQL statement that will return the title and age in years of each movie, with newest movies listed first:

```sql
SELECT title, date_part('year', CURRENT_DATE) - "year" AS age 
  FROM films
  ORDER BY age;
```

> Write a SQL statement that will return the title and duration of each movie longer than two hours, with the longest movies first.

```sql
SELECT title, duration
  FROM films
  WHERE duration > 120
  ORDER BY duration DESC;
```

> Write a SQL statement that returns the title of the longest film.

```sql
SELECT title
  FROM films
  ORDER BY duration DESC
  LIMIT 1;
```

## Topic 08: More Single Table Queries

> Create a new database called `residents` using the PostgreSQL command line tools.

`$ createdb residents`

> Load this file into the database created in #1.

`$ psql -d residents < file.sql`

> Write a SQL query to list the ten states with the most rows in the `people` table in descending order.

```sql
SELECT state, count(state) FROM people
  GROUP BY state
  ORDER BY count(state) DESC
  LIMIT 10;
```

> Write a SQL query that lists each domain used in an email address in the `people` table and how many people in the database have an email address containing that domain. Domains should be listed with the most popular first.

```sql
SELECT split_part(email, '@', 2) AS domain, count(id) 
  FROM people
  GROUP BY domain
  ORDER BY count(id) DESC;
```

> Write a SQL statement that will delete the person with ID `3399` from the `people` table.

```sql
DELETE FROM people
  WHERE id = 3399;
```

> Write a SQL statement that will delete all users that are located in the state of California (`CA`).

```sql
DELETE FROM people
  WHERE state = 'CA';
```

> Write a SQL statement that will update the `given_name` values to be all uppercase for all users with an email address that contains `teleworm.us`.

```sql
UPDATE people
  SET given_name = UPPER(given_name)
  WHERE split_part(email, '@', 2) LIKE 'teleworm.us';

-- or

UPDATE people
  SET given_name = UPPER(given_name)
  WHERE email LIKE '%teleworm.us';
```

> Write a SQL statement that will delete all rows from the people table.

```sql
DELETE FROM people;
```

## Topic 09: `NOT NULL` and Default Values

> What is the result of using an operator on a NULL value?

When we use an operator on a NULL value in SQL, the result is NULL.

> Set the default value of column `department` to "unassigned". Then set the value of the `department` column to "unassigned" for any rows where it has a NULL value. Finally, add a NOT NULL constraint to the `department` column.

```sql
ALTER TABLE employees
  ALTER COLUMN department SET DEFAULT 'unassigned';

UPDATE employees
  SET department = 'unassigned'
  WHERE department IS NULL;

ALTER TABLE employees
  ALTER COLUMN department SET NOT NULL;
```

> Write the SQL statement to create a table called **temperatures** to hold the following data:

> Keep in mind that all rows in the table should always contain all three values.

```sql
CREATE TABLE temperatures (
  date date NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL);
```

> Write the SQL statements needed to insert the data shown in #3 into the **temperatures** table.

```sql
INSERT INTO temperatures (date, low, high)
  VALUES ('2016-03-01', 34, 43),
         ('2016-03-02', 32, 44),
         ('2016-03-03', 31, 47),
         ('2016-03-04', 33, 42),
         ('2016-03-05', 39, 46),
         ('2016-03-06', 32, 43),
         ('2016-03-07', 29, 32),
         ('2016-03-08', 23, 31),
         ('2016-03-09', 17, 28);
```

> Write a SQL statement to determine the average (mean) temperature (divide the sum of the high and low temperatures by two) for each day from March 2, 2016 through March 8, 2016. Make sure to round each average value to one decimal place.

```sql
SELECT date, round(((high + low) / 2.0), 1) AS average
  FROM temperatures
  WHERE DATE_PART('day', date) >= 02 AND DATE_PART('day', date) <= 08;
```

We can also use the comparison predicate `BETWEEN` in combination with `AND` to find specific rows:
`WHERE date BETWEEN '2016-03-02' AND '2016-03-08'`

`average` can also be obtained without the `ROUND` function:
`((high + low) / 2.0)::decimal(3,1)`

> Write a SQL statement to add a new column, `rainfall`, to the **temperatures** table. It should store millimeters of rain as integers and have a default value of `0`.

```sql
ALTER TABLE temperatures
  ADD COLUMN rainfall integer DEFAULT 0;
```

> Each day, it rains one millimeter for every degree the average temperature goes above 35. Write a SQL statement to update the data in the table **temperatures** to reflect this.

```sql
UPDATE temperatures
  SET rainfall = (low + high) / 2.0 - 35
  WHERE (low + high) / 2 > 35;
```

> A decision has been made to store rainfall data in inches. Write the SQL statements required to modify the `rainfall` column to reflect these new requirements.

```sql
ALTER TABLE temperatures
  ALTER COLUMN rainfall TYPE decimal(6,3);

UPDATE temperatures
  SET rainfall = (rainfall / 25.4);
```

> Write a SQL statement that renames the **temperatures** table to **weather**.

```sql
ALTER TABLE temperatures
  RENAME TO weather;
```

> What psql meta command shows the structure of a table? Use it to describe the structure of **weather**.

`\d` describes the argument passed to it.

`\d weather`

> What PostgreSQL program can be used to create a SQL file that contains the SQL commands needed to recreate the current structure and data of the weather table?

`pg_dump` is a utility used to back up a PostgreSQL database. It extracts the database into a file.

`pg_dump -d lesson02_topic09_notnull_and_default -t weather --inserts > dump.sql`

## Topic 10: More Constraints
> Import this file into a PostgreSQL database.

`$ psql -d lesson02_topic10_db < dump.sql`

> Modify all of the columns to be `NOT NULL`.

```sql
ALTER TABLE films
  ALTER COLUMN title SET NOT NULL,
  ALTER COLUMN "year" SET NOT NULL,
  ALTER COLUMN genre SET NOT NULL,
  ALTER COLUMN director SET NOT NULL,
  ALTER COLUMN duration SET NOT NULL;
```

> How does modifying a column to be `NOT NULL` affect how it is displayed by `\d films`?

"not null" in included in the table's schema for each column.

> Add a constraint to the table **films** that ensures that all films have a unique title.

```sql
ALTER TABLE films
  ADD CONSTRAINT unique_title UNIQUE (title);
```

> How is the constraint added in #4 displayed by \d films?

The constraint creates a b-tree index.

```
Indexes:
    "unique_title" UNIQUE CONSTRAINT, btree (title)
```

> Write a SQL statement to remove the constraint added in #4.

```sql
ALTER TABLE films
  DROP CONSTRAINT unique_title;
```

> Add a constraint to **films** that requires all rows to have a value for **title** that is at least 1 character long.

```sql
ALTER TABLE films
  ADD CONSTRAINT title_length CHECK (length(title) >= 1);
```

> What error is shown if the constraint created in #7 is violated? Write a SQL `INSERT` statement that demonstrates this.

```sql
INSERT INTO films (title, "year", genre, director, duration)
  VALUES ('', 1990, 'comedy', 'Spike Lee', 120);

ERROR:  new row for relation "films" violates check constraint "title_length"
DETAIL:  Failing row contains (, 1990, comedy, Spike Lee, 120).
```

> How is the constraint added in #7 displayed by `\d films`?

As a check constraint.

```
Check constraints:
    "title_length" CHECK (length(title::text) >= 1)
```

> Write a SQL statement to remove the constraint added in #7.

```sql
ALTER TABLE films
  DROP CONSTRAINT title_length;
```

> Add a constraint to the table `films` that ensures that all films have a year between 1900 and 2100.

```sql
ALTER TABLE films
  ADD CONSTRAINT year_between_1900_2100 CHECK ("year" BETWEEN 1900 AND 2100);
```

> How is the constraint added in #11 displayed by `\d films`?

As a check constraint. 

`
Check constraints:
    "year_between_1900_2100" CHECK (year >= 1900 AND year <= 2100)
`

> Add a constraint to **films** that requires all rows to have a value for `director` that is at least 3 characters long and contains at least one space character ( ).

```sql
ALTER TABLE films
  ADD CONSTRAINT director_value CHECK (length(director) >= 3 AND position(' ' in director) > 0);
```

> How does the constraint created in #13 appear in `\d films`?

As a check constraint.

`
Check constraints:
    "director_value" CHECK (length(director::text) >= 3 AND POSITION((' '::text) IN (director)) > 0)
`

> Write an `UPDATE` statement that attempts to change the director for "Die Hard" to "Johnny". Show the error that occurs when this statement is executed.

```sql
UPDATE films
  SET director = 'Johnny'
  WHERE title = 'Die Hard';
```

`
ERROR:  new row for relation "films" violates check constraint "director_value"
DETAIL:  Failing row contains (Die Hard, 1988, action, Johnny, 132).
`

> List three ways to use the schema to restrict what values can be stored in a column.

- Set data type for the column
- Set a NOT NULL constraint for the column
- Define a CHECK constraint for the column

> Is it possible to define a default value for a column that will be considered invalid by a constraint? Create a table that tests this.

No.

> How can you see a list of all of the constraints on a table?

`\d` passed the name of the table as an argument.

## Topic 11: Using Keys

> Write a SQL statement that makes a new sequence called "counter".

```sql
CREATE SEQUENCE counter;
```

> Write a SQL statement to retrieve the next value from the sequence created in #1.

```sql
SELECT nextval('counter');
```

> Write a SQL statement that removes a sequence called "counter".


```sql
DROP SEQUENCE counter;
```

> Is it possible to create a sequence that returns only even numbers? The documentation for sequence might be useful.

Yes.

```sql
CREATE SEQUENCE only_evens 
  INCREMENT BY 2
  START WITH 2;
```

> What will the name of the sequence created by the following SQL statement be?

`regions_id_seq`

> Write a SQL statement to add an auto-incrementing integer primary key column to the `films` table.

```sql
ALTER TABLE films
  ADD COLUMN id serial PRIMARY KEY;
```

> What error do you receive if you attempt to update a row to have a value for `id` that is used by another row?

```sql
UPDATE films
  SET id = 6
  WHERE title = 'Godzilla';
```

```
ERROR:  duplicate key value violates unique constraint "films_pkey"
DETAIL:  Key (id)=(6) already exists.
```

> What error do you receive if you attempt to add another primary key column to the `films` table?

```sql
ALTER TABLE films
  ADD COLUMN another_pkey serial PRIMARY KEY;
```

`ERROR:  multiple primary keys for table "films" are not allowed`

> Write a SQL statement that modifies the table `films` to remove its primary key while preserving the id column and the values it contains.

```sql
ALTER TABLE films
  DROP CONSTRAINT films_pkey;
```

## Topic 12: `GROUP BY` and Aggregate Functions

> Import this file into a database.

`$ psql -d dbname < file.sql`

> Write SQL statements that will insert the following films into the database:

```sql
INSERT INTO films (title, year, genre, director, duration)
  VALUES ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
         ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);
```

> Write a SQL query that lists all genres for which there is a movie in the `films` table.

```sql
SELECT DISTINCT genre FROM films;
```

> Write a SQL query that returns the same results as the answer for #3, but without using `DISTINCT`.

```sql
SELECT genre FROM films
  GROUP BY genre;
```

> Write a SQL query that determines the average duration across all the movies in the `films` table, rounded to the nearest minute.

```sql
SELECT ROUND(AVG(duration)) FROM films;
```

> Write a SQL query that determines the average duration for each genre in the `films` table, rounded to the nearest minute.

```sql
SELECT genre, ROUND(AVG(duration)) AS average_duration FROM films
  GROUP BY genre;
```

> Write a SQL query that determines the average duration of movies for each decade represented in the `films` table, rounded to the nearest minute and listed in chronological order.

```sql
SELECT year / 10 * 10 AS decade, ROUND(AVG(duration), 0) AS average_duration FROM films
  GROUP BY decade
  ORDER BY decade;
```

> Write a SQL query that finds all films whose director has the first name `John`.

```sql
SELECT * FROM films
  WHERE director LIKE 'John %';
```

> Write a SQL query that will return the following data:

```sql
SELECT genre, count(id) FROM films
  GROUP BY genre
  ORDER BY count(id) DESC;
```

> Write a SQL query that will return the following data:

```sql
SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films 
  FROM films
  GROUP BY decade, genre
  ORDER BY decade, genre;
```

> Write a SQL query that will return the following data:

```sql
SELECT genre, sum(duration) AS total_duration
  FROM films
  GROUP BY genre
  ORDER BY total_duration, genre;
```
