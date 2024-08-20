-- 1. Create a new database called residents using the PostgreSQL command line tools.

$ createdb residents 

-- 2. Load this file into the database created in #1.

$ psql -d residents < dump.sql

OR

residents=# \i dump.sql

-- 3. Write a SQL query to list the ten states with the most rows in the people table in descending order.

--  state | count
-- -------+-------
--  CA    |  1064
--  TX    |   734
--  NY    |   596
--  FL    |   528
--  IL    |   464
--  PA    |   445
--  MI    |   372
--  OH    |   372
--  GA    |   306
--  NJ    |   303
-- (10 rows)

SELECT state, count(state) FROM people
GROUP BY state
ORDER BY count(state) DESC
LIMIT 10;

-- 4. Write a SQL query that lists each domain used in an email address in the people table and how many people in the database have an email address containing that domain. Domains should be listed with the most popular first.

     domain     | count
----------------+-------
 cuvox.de       |  1036
 gustr.com      |  1029
 rhyta.com      |  1024
 superrito.com  |  1018
 armyspy.com    |  1006
 jourrapide.com |  1000
 teleworm.us    |   998
 dayrep.com     |   966
 einrot.com     |   965
 fleckens.hu    |   958
(10 rows)

SELECT split_part(email, '@', 2) AS domain, count(id) 
FROM people
GROUP BY domain
ORDER BY count(id) DESC;

OR 

SELECT substr(email, strpos(email, '@') + 1) as domain,
         COUNT(id)
  FROM people
  GROUP BY domain
  ORDER BY count DESC;

-- 5. Write a SQL statement that will delete the person with ID 3399 from the people table.

DELETE FROM people
WHERE id = 3399;

-- 6. Write a SQL statement that will delete all users that are located in the state of California (CA).

DELETE FROM people
WHERE state = 'CA';

-- Write a SQL statement that will update the given_name values to be all uppercase for all users with an email address that contains teleworm.us.

UPDATE people
SET given_name = upper(given_name)
WHERE email LIKE '%teleworm.us%';

-- Write a SQL statement that will delete all rows from the people table.

DELETE FROM people;
