-- What kind of programming language is SQL?

SQL is a Special Purpose Language used to interact with relational databases.

-- What are the three sublanguages of SQL?

Data Control Language (DCL),
Data Definition Language (DDL),
Data Manipulation Language (DML)

-- Write the following values as quoted string values that could be used in a SQL query.

'canoe'
'a long road'
'weren''t'
'"No way!"'

-- What operator is used to concatenate strings?

||

SELECT 'hello' || 'bye';
-- ?column? 
------------
-- hellobye
--(1 row)

-- What function returns a lowercased version of a string? Write a SQL statement using it.

lower()

SELECT lower('ABc');
-- abc

--- How does the psql console display true and false values?

t and f

-- The surface area of a sphere is calculated using the formula A = 4π r2, where A is the surface area and r is the radius of the sphere. 
-- Use SQL to compute the surface area of a sphere with a radius of 26.3cm, truncated to return an integer.

SELECT trunc(4 * pi() *26.3^2);
