-- 1. Import this file into a PostgreSQL database.

$ psql -d sql-course < films.sql

-- 2. Modify all of the columns to be NOT NULL.

ALTER TABLE films
ALTER COLUMN title SET NOT NULL;

ALTER TABLE films
ALTER COLUMN year SET NOT NULL;

ALTER TABLE films
ALTER COLUMN genre SET NOT NULL;

ALTER TABLE films
ALTER COLUMN director SET NOT NULL;

ALTER TABLE films
ALTER COLUMN duration SET NOT NULL;

-- 3. How does modifying a column to be NOT NULL affect how it is displayed by \d films?

Under the "Nullable" constraint, it says "not null" for all columns 

-- 4. Add a constraint to the table films that ensures that all films have a unique title.

ALTER TABLE films
ADD CONSTRAINT unique_title UNIQUE (title);

-- 5. How is the constraint added in #4 displayed by \d films?

It is listed under Indexes

-- 6. Write a SQL statement to remove the constraint added in #4.

ALTER TABLE films
DROP CONSTRAINT unique_title;

-- 7. Add a constraint to films that requires all rows to have a value for title that is at least 1 character long.

ALTER TABLE films
ADD CHECK (length(title) > 1);

-- 8. What error is shown if the constraint created in #7 is violated? Write a SQL INSERT statement that demonstrates this.

ERROR:  new row for relation "films" violates check constraint "films_title_check"
DETAIL:  Failing row contains (, 1000, scifi, Stephen King, 123).

-- 9. How is the constraint added in #7 displayed by \d films?

It is listed under Check Constraints

-- 10. Write a SQL statement to remove the constraint added in #7.

ALTER TABLE films
DROP CONSTRAINT films_title_check;

-- 11. Add a constraint to the table films that ensures that all films have a year between 1900 and 2100.

ALTER TABLE films
ADD CONSTRAINT year_between_1900_2100 CHECK (year BETWEEN 1900 AND 2100);

-- 12. How is the constraint added in #11 displayed by \d films?

It is listed under Check Constraints

-- 13. Add a constraint to films that requires all rows to have a value for director that is at least 3 characters long and contains at least one space character ().

ALTER TABLE films
ADD CONSTRAINT director_name CHECK (length(director) >= 3 AND position(' ' IN director) > 0);

-- 14. How does the constraint created in #13 appear in \d films?

It is listed under Check Constraints

-- 15. Write an UPDATE statement that attempts to change the director for "Die Hard" to "Johnny". Show the error that occurs when this statement is executed.

UPDATE films
SET director = 'Johnny'
WHERE title = 'Die Hard';

ERROR:  new row for relation "films" violates check constraint "director_name"
DETAIL:  Failing row contains (Die Hard, 1988, action, Johnny, 132).

-- 16. List three ways to use the schema to restrict what values can be stored in a column.

1. Data type
2. NOT NULL constraint
3. Check constraint

-- 17. Is it possible to define a default value for a column that will be considered invalid by a constraint? Create a table that tests this.

sql-course=# CREATE TABLE books
(name text, genre text, price integer DEFAULT 0);
CREATE TABLE

sql-course=# ALTER TABLE books ADD CONSTRAINT book_price CHECK (price > 0);
ALTER TABLE

The default value for price, 0, will be rejected by the book_price constraint:

sql-course=# INSERT INTO books (name, genre) VALUES ('The Catcher in the Rye', 'fiction');
ERROR:  new row for relation "books" violates check constraint "book_price"
DETAIL:  Failing row contains (The Catcher in the Rye, fiction, 0).

-- 18. How can you see a list of all of the constraints on a table?

Using \d followed by the name of the table
