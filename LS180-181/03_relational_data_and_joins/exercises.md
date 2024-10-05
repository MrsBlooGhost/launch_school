# Lesson 03: Relational Data and JOINs

## Topic 03: Database Diagrams - Levels of Schema

> What are the three levels of schema?

Conceptual, logical, and physical

> What is a conceptual schema?

A conceptual schema is a high-level design that focuses on entities and their relationships.

> What is a physical schema?

A physical schema is a low-level database-specifc implementation of a conceptual schema.

> What are the three types of relationships that can be shown in a database diagram?

One-to-one, one-to-many, many-to-many

## Topic 04: Cardinality and Modality

> What is *cardinality*?

Cardinality refers to the number of objects of each side of a relationship.

> What is *modality*?

Modality refers to whether the number of objects of each side of a relationship is optional (0) or required (1).

> If one side of a relationship has a modality of 1, what is the smallest number of instances that can be on that side of the relationship?

1

> What type of notation was described in depth throughout most of the video?

Crow's Foot notation

## Topic 06: Working with Multiple Tables

> Import this file into an empty PostgreSQL database. Note: the file contains a lot of data and may take a while to run; your terminal should return to the command prompt once the import is complete.

`$ psql -d dbname < file.sql`

or if connected to desired psql database:

```sql
\i file.sql
```

> Write a query that determines how many tickets have been sold.

```sql
SELECT count(id) FROM tickets;
```

> Write a query that determines how many different customers purchased tickets to at least one event.

```sql
SELECT COUNT(DISTINCT customer_id) FROM tickets;
```

> Write a query that determines what percentage of the customers in the database have purchased a ticket to one or more of the events.

```sql
SELECT ROUND ( COUNT(DISTINCT tickets.customer_id)::decimal / COUNT(DISTINCT customers.id) * 100, 2 ) AS percent
  FROM tickets
  RIGHT OUTER JOIN customers
    ON tickets.customer_id = customers.id;
```

> Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

```sql
SELECT e.name, COUNT(t.event_id) AS popularity
  FROM events e
  LEFT JOIN tickets t
    ON e.id = t.event_id
  GROUP BY e.name
  ORDER BY popularity DESC;
```

> Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

```sql
SELECT c.id, c.email, COUNT(DISTINCT t.event_id)
  FROM customers c
  INNER JOIN tickets t
    ON c.id = t.customer_id
  GROUP BY c.id
  HAVING COUNT(DISTINCT t.event_id) = 3;
```

> Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. The report should include the event name and starts_at and the seat's section name, row, and seat number.

```sql
SELECT e.name AS event, 
       e.starts_at, 
       sections.name AS section, 
       seats.row, 
       seats.number AS seat
  FROM tickets t
  INNER JOIN customers c
    ON t.customer_id = c.id
  INNER JOIN events e
    ON t.event_id = e.id
  INNER JOIN seats
    ON t.seat_id = seats.id
  INNER JOIN sections
    ON seats.section_id = sections.id
  WHERE c.email = 'gennaro.rath@mcdermott.co';
```

## Topic 07: Using Foreign Keys

> Import this file into a new database.

```
$ createdb dbname
$ psql -d dbname < file.sql
```

or

Connect to the database. Then...
```sql
\i file.sql
```

> Update the `orders` table so that referential integrity will be preserved for the data between `orders` and `products`.

```sql
ALTER TABLE orders
  ADD CONSTRAINT orders_product_id_fkey
  FOREIGN KEY (product_id) REFERENCES products(id);
```

> Use `psql` to insert the data shown in the following table into the database:

```sql
INSERT INTO products (id, name)
  VALUES (1, 'small bolt'),
         (2, 'large bolt');

INSERT INTO orders (id, product_id, quantity)
  VALUES (1, 1, 10),
         (2, 1, 25),
         (3, 2, 15);
```

> Write a SQL statement that returns a result like this:

```sql
SELECT o.quantity, p.name
  FROM orders AS o
  INNER JOIN products AS p
    ON o.product_id = p.id;
```

> Can you insert a row into `orders` without a `product_id`? Write a SQL statement to prove your answer.

Yes. There isn't a `NOT NULL` constraint on `product_id`.

```sql
INSERT INTO orders (id, product_id, quantity)
  VALUES (4, NULL, 100);
```

> Write a SQL statement that will prevent NULL values from being stored in orders.product_id. What happens if you execute that statement?

> Make any changes needed to avoid the error message encountered in #6.

```sql
DELETE FROM orders
  WHERE product_id IS NULL;

ALTER TABLE orders
  ALTER COLUMN product_id SET NOT NULL;
```

> Create a new table called `reviews` to store the data shown below. This table should include a primary key and a reference to the `products` table.

```sql
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  body TEXT NOT NULL,
  product_id INTEGER REFERENCES products (id);
```

> Write SQL statements to insert the data shown in the table in #8.

```sql
INSERT INTO reviews (body, product_id)
  VALUES ('a little small', 1),
         ('very round!', 1),
         ('could have been smaller', 2);
```

> True or false: A foreign key constraint prevents NULL values from being stored in a column.

False. Foreign key columns allow `NULL` values.

## Topic 08: One-to-Many Relationships

> Write a SQL statement to add the following call data to the database:

```sql
INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-18 14:47:00', 632,	6);
```

> Write a SQL statement to retrieve the call times, duration, and first name for all calls **not** made to William Swift.

```sql
SELECT calls.when, calls.duration, contacts.first_name
  FROM calls
  INNER JOIN contacts
    ON calls.contact_id = contacts.id
  WHERE (contacts.first_name || ' ' || contacts.last_name) != 'William Swift';
```

> Write SQL statements to add the following call data to the database:

```sql
INSERT INTO contacts (first_name, last_name, number)
  VALUES ('Merve', 'Elk', 6343511126),
         ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-17 11:52:00', 175, 26),
         ('2016-01-18 21:22:00', 79, 27);
```

> Add a constraint to **contacts** that prevents a duplicate value being added in the column `number`.

```sql
ALTER TABLE contacts
  ADD CONSTRAINT unique_number UNIQUE (number);
```

> Write a SQL statement that attempts to insert a duplicate number for a new contact but fails. What error is shown?

```sql
INSERT INTO contacts (first_name, last_name, number)
  VALUES ('Gerald', 'Arnold', 6125594874);

ERROR:  duplicate key value violates unique constraint "unique_number"
DETAIL:  Key (number)=(6125594874) already exists.
```

> Why does "when" need to be quoted in many of the queries in this lesson?

"when" is a SQL keyword. Because we intend to utilize it as an identifier and not a keyword in our queries, we need to escape it by surrounding it with quotes.

> Draw an entity-relationship diagram for the data we've been working with in this assignment.
 _________         ______
|         |    /  |      |
| contact | --O-  | call |
|_________|    \  |______|

One contact - to - many calls
The circle on the Call side indicates that it is optional.

## Topic 12: Many-to-Many Relationships

> The `books_categories` table from this database was created with foreign keys that don't have the `NOT NULL` and `ON DELETE CASCADE` constraints. Go ahead and add them now.

```sql
-- Add the `NOT NULL` constraint
ALTER TABLE books_categories
  ALTER COLUMN book_id SET NOT NULL,
  ALTER COLUMN category_id SET NOT NULL;

-- Add the `ON DELETE CASCADE` constraint
ALTER TABLE books_categories
  DROP CONSTRAINT books_categories_book_id_fkey,
  ADD CONSTRAINT books_categories_book_id_fkey
    FOREIGN KEY (book_id) REFERENCES books (id) 
      ON DELETE CASCADE, 
  DROP CONSTRAINT books_categories_category_id_fkey,
  ADD CONSTRAINT books_categories_category_id_fkey
    FOREIGN KEY (category_id) REFERENCES categories (id) 
      ON DELETE CASCADE;
```

> Write a SQL statement that will return the following result:

```sql
SELECT b.id, b.author, string_agg(c.name, ', ') AS categories
  FROM books AS b
    INNER JOIN books_categories
      ON b.id = books_categories.book_id
    INNER JOIN categories AS c
      ON c.id = books_categories.category_id
  GROUP BY b.id
  ORDER BY b.id;
```

> Write SQL statements to insert the following new books into the database. What do you need to do to ensure this data fits in the database?

```sql
ALTER TABLE books
  ALTER COLUMN title TYPE text,
  ALTER COLUMN author TYPE varchar(50);

INSERT INTO books (author, title)
  VALUES ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
         ('Charlotte Brontë', 'Jane Eyre'),
         ('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories (name)
  VALUES ('Space Exploration'),
         ('Cookbook'),
         ('South Asia');

INSERT INTO books_categories (book_id, category_id)
  VALUES (4, 5),   
         (4, 1),
         (4, 7),
         (5, 2),
         (5, 4),
         (6, 8),
         (6, 1),
         (6, 10);                                                                      
```

> Write a SQL statement to add a uniqueness constraint on the combination of columns `book_id` and `category_id` of the `books_categories` table. This constraint should be a table constraint; so, it should check for uniqueness on the combination of `book_id` and `category_id` across all rows of the `books_categories` table.

```sql
ALTER TABLE books_categories
  ADD UNIQUE (book_id, category_id);
```

> Write a SQL statement that will return the following result:

```sql
SELECT c.name, COUNT(b.id) AS book_count, STRING_AGG(b.title, ', ') AS book_titles
  FROM books_categories AS bc
    INNER JOIN books AS b
      ON bc.book_id = b.id
    INNER JOIN categories AS c
      ON bc.category_id = c.id
  GROUP BY c.id
  ORDER BY c.name;
```

## Topic 13: Converting a 1:M Relationship to a M:M Relationship

> Write the SQL statement needed to create a join table that will allow a film to have multiple directors, and directors to have multiple films. Include an `id` column in this table, and add foreign key constraints to the other columns.

```sql
CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors (id) ON DELETE CASCADE,
  film_id integer REFERENCES films (id) ON DELETE CASCADE,
  UNIQUE (director_id, film_id)
);
```

> Write the SQL statements needed to insert data into the new join table to represent the existing one-to-many relationships.

```sql
INSERT INTO directors_films (director_id, film_id)
  VALUES (1, 1),
         (2, 2),
         (3, 3),
         (3, 7),
         (4, 4),
         (4, 10),
         (5, 5),
         (6, 6),
         (7, 8),
         (8, 9);                                   
```

> Write a SQL statement to remove any unneeded columns from films.

```sql
ALTER TABLE films
  DROP COLUMN director_id;
```
> Write a SQL statement that will return the following result:

```sql
SELECT f.title, d.name
  FROM directors_films AS df
    INNER JOIN directors AS d
      ON df.director_id = d.id
    INNER JOIN films AS f
      ON df.film_id = f.id
  ORDER BY f.title;
```

> Write SQL statements to insert data for the following films into the database:

```sql
INSERT INTO films (title, year, genre, duration)
  VALUES ('Fargo', 1996, 'comedy', 98),
         ('No Country for Old Men', 2007, 'western', 122),
         ('Sin City', 2005, 'crime', 124),
         ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors (name)
  VALUES ('Joel Coen'),
         ('Ethan Coen'),
         ('Frank Miller'),
         ('Robert Rodriguez');

INSERT INTO directors_films (director_id, film_id)
  VALUES (9, 11),
         (9, 12),
         (10, 12),
         (11, 13),
         (12, 13),
         (12, 14);
```

> Write a SQL statement that determines how many films each director in the database has directed. Sort the results by number of films (greatest first) and then name (in alphabetical order).

```sql
SELECT d.name AS director, COUNT(f.id) AS films
  FROM directors_films AS df
  INNER JOIN directors AS d
    ON df.director_id = d.id
  INNER JOIN films AS f
    ON df.film_id = f.id
  GROUP BY d.id
  ORDER BY films DESC, d.name;
```
