# LS180 - SQL Fundamentals

## Medium: Subqueries and More

**1 -	Set Up the Database using \copy**
> This set of exercises will focus on an auction. Create a new database called `auction`. In this database there will be three tables, `bidders`, `items`, and `bids`. After creating the database, set up the 3 tables using the following specifications:

```sql
CREATE DATABASE auction;

\c auction

CREATE TABLE bidders (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  initial_price NUMERIC(6, 2) NOT NULL CHECK (initial_price BETWEEN 0.01 AND 1000.00),
  sales_price NUMERIC(6, 2) CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id SERIAL PRIMARY KEY,
  bidder_id INTEGER NOT NULL REFERENCES bidders (id) ON DELETE CASCADE,
  item_id INTEGER NOT NULL REFERENCES items (id) ON DELETE CASCADE,
  amount NUMERIC(6, 2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);
```

> Finally, use the `\copy` meta-command to import the below files into your auction database. You'll have to create these files yourself before you can import them with` \copy`.

```sql
\copy bidders FROM '01_bidders.csv' WITH HEADER CSV

\copy items FROM '01_items.csv' WITH HEADER CSV

\copy bids FROM '01_bids.csv' WITH HEADER CSV
```

**2 -	Conditional Subqueries: IN**
> Write a SQL query that shows all items that have had bids put on them. Use the logical operator `IN` for this exercise, as well as a subquery.

```sql
SELECT name AS "Bid on Items"
  FROM items
  WHERE items.id 
    IN 
      (SELECT DISTINCT item_id 
      FROM bids);
```

Questions:
- Where, syntactically, do I put the "AS" clause in order to rename the column to "Bid on Items"?
- In my subquery, I didn't include a SELECT DISTINCT clause, but the official solution does. This comes down to a performance issue that I didn't account for nor do I think we need to know at this point.

**3 -	Conditional Subqueries: NOT IN**
> Write a SQL query that shows all items that have not had bids put on them. Use the logical operator `NOT IN` for this exercise, as well as a subquery.

```sql
SELECT name AS "Not Bid On"
  FROM items
  WHERE items.id
    NOT IN 
      (SELECT item_id 
      FROM bids);
```

**4 -	Conditional Subqueries: EXISTS**
> Write a `SELECT` query that returns a list of names of everyone who has bid in the auction. While it is possible (and perhaps easier) to do this with a `JOIN` clause, we're going to do things differently: use a subquery with the `EXISTS` clause instead. Here is the expected output:

```sql
SELECT name
  FROM bidders
  WHERE
    EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```

**5 -	Query From a Transient Table**
> For this exercise, we'll make a slight departure from how we've been using subqueries. We have so far used subqueries to filter our results using a WHERE clause. In this exercise, we will build that filtering into the table that we will query. Write an SQL query that finds the largest number of bids from an individual bidder.

For this exercise, you must use a subquery to generate a result table (or transient table), and then query that table for the largest number of bids.

```sql
SELECT MAX(bid_counts.count) 
  FROM (SELECT COUNT(item_id) 
        FROM bids
        GROUP BY bidder_id)
  AS bid_counts;
```

**6 -	Scalar Subqueries**
> For this exercise, use a scalar subquery to determine the number of bids on each item. The entire query should return a table that has the name of each item along with the number of bids on an item.

```sql
SELECT name,
       (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
FROM items;
```

**7 -	Row Comparison**
> We want to check that a given item is in our database. There is one problem though: we have all of the data for the item, but we don't know the `id` number. Write an SQL query that will display the `id` for the item that matches all of the data that we know, but does not use the `AND` keyword. Here is the data we know:

```sql
SELECT id FROM items
  WHERE ROW('Painting', 100.00, 250.00) = ROW(name, initial_price, sales_price);
```

**8 -	EXPLAIN**
> For this exercise, let's explore the `EXPLAIN` PostgreSQL statement. It's a very useful SQL statement that lets us analyze the efficiency of our SQL statements. More specifically, use `EXPLAIN` to check the efficiency of the query statement we used in the exercise on `EXISTS`:

```sql
EXPLAIN 
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

EXPLAIN ANALYZE
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
```

**9 -	Comparing SQL Statements**
>

```sql

```
