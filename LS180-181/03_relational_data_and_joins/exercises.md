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

  count
-------
  1652
(1 row)

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
