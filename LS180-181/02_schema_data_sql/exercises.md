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

No. There's a specific data type, `timestop with time zone`, or `timestamptz`, that should be used to store a time with a time zone in a column.

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
