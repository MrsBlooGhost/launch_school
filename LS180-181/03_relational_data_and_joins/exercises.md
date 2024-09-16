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

False. Froeign key columns allow `NULL` values.

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

## Topic
