# LS180 - SQL Fundamentals

## Medium: Many to Many

**1 -	Set Up Database**
> Initially, we need to create a `billing` database with a `customers` table and a `services` table. 

```sql
CREATE DATABASE billing;

\c billing

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token varchar(8) UNIQUE NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);
```

> Once you've created these tables, here is some data that you can enter into them.

```sql
INSERT INTO customers (name, payment_token)
  VALUES ('Pat Johnson', 'XHGOAHEQ'),
         ('Nancy Monreal', 'JKWQPJKL'),
         ('Lynn Blake', 'KLZXWEEE'),
         ('Chen Ke-Hua', 'KWETYCVX'),
         ('Scott Lakso', 'UUEAPQPS'),
         ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
  VALUES ('Unix Hosting', 5.95),
         ('DNS', 4.95),
         ('Whois Registration', 1.95),
         ('High Bandwidth', 15.00),
         ('Business Support', 250.00),
         ('Dedicated Hosting', 50.00),
         ('Bulk Email', 250.00),
         ('One-to-one Training', 999.00);
```

> Once you have entered the data into your tables, create a join table that associates customers with services and vice versa. The join table should have columns for both the services id and the customers id, as well as a primary key named `id` that auto-increments.

> The customer id in this table should have the property that deleting the corresponding customer record from the `customers` table will automatically delete all rows from the join table that have that `customer_id`. Do not apply this same property to the service id.

> Each combination of customer and service in the table should be unique. In other words, a customer shouldn't be listed as using a particular service more than once.

```sql
CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  service_id integer REFERENCES services (id) NOT NULL,
  customer_id integer REFERENCES customers (id) ON DELETE CASCADE NOT NULL,
  UNIQUE (service_id, customer_id)
);
```

> Enter some data in the join table that shows which services each customer uses as follows:

```sql
INSERT INTO customers_services (customer_id, service_id)
  VALUES (1, 1), (1, 2), (1, 3),
         (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
         (4, 1), (4, 4),
         (5, 1), (5, 2), (5, 6),
         (6, 1), (6, 6), (6, 7);
```

**2 -	Get Customers With Services**
> Write a query to retrieve the `customer` data for every customer who currently subscribes to at least one service.

```sql
SELECT DISTINCT c.* FROM customers AS c
  INNER JOIN customers_services AS cs
    ON c.id = cs.customer_id;
```

**3 -	Get Customers With No Services**
> Write a query to retrieve the `customer` data for every customer who does not currently subscribe to any services.

```sql
SELECT c.* FROM customers AS c
  LEFT OUTER JOIN customers_services AS cs
    ON c.id = cs.customer_id
  WHERE cs.service_id IS NULL;
```

**4 -	Get Services With No Customers**
> Using RIGHT OUTER JOIN, write a query to display a list of all services that are not currently in use. Your output should look like this:

```sql
SELECT s.description
  FROM customers_services AS cs
  RIGHT OUTER JOIN services AS s
    ON cs.service_id = s.id
  WHERE cs.service_id IS NULL;
```

**5 -	Services for each Customer**
> Write a query to display a list of all customer names together with a comma-separated list of the services they use. Your output should look like this:

```sql
SELECT c.name, STRING_AGG(s.description, ', ') AS services
  FROM customers AS c
  LEFT OUTER JOIN customers_services AS cs
    ON c.id = cs.customer_id
  LEFT OUTER JOIN services AS s
    ON cs.service_id = s.id
  GROUP BY c.id;
```

**6 -	Services With At Least 3 Customers**
> Write a query that displays the description for every service that is subscribed to by at least 3 customers. Include the customer count for each description in the report. The report should look like this:

```sql
SELECT s.description, COUNT(cs.customer_id)
  FROM services AS s
  LEFT OUTER JOIN customers_services AS cs
               ON s.id = cs.service_id
  GROUP BY s.id
  HAVING COUNT(cs.customer_id) >= 3;
```

Questions:
- The official solution uses a LEFT JOIN (instead of INNER JOIN), which returns a virtual table with services that have no customer subscribers. This doesn't seem necessary. In a larger database, wouldn't this cause performance issues?

**7 -	Total Gross Income**
> Assuming that everybody in our database has a bill coming due, and that all of them will pay on time, write a query to compute the total gross income we expect to receive.

```sql
SELECT SUM(price) AS gross
  FROM services AS s
  INNER JOIN customers_services AS cs
          ON s.id = cs.service_id;
```

**8 -	Add New Customer**
> A new customer, 'John Doe', has signed up with our company. His payment token is 'EYODHLCN'. Initially, he has signed up for UNIX hosting, DNS, and Whois Registration. Create any SQL statement(s) needed to add this record to the database.

```sql
INSERT INTO customers (name, payment_token)
  VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
  VALUES (7, 1), (7, 2), (7, 3);
```

**9 -	Hypothetically**
> As a prelude to his decision making, he asks for two numbers: the amount of expected income from "big ticket" services (those services that cost more than $100) and the maximum income the company could achieve if it managed to convince all of its customers to select all of the company's big ticket items.

For simplicity, your solution should involve two separate SQL queries: one that reports the current expected income level, and one that reports the hypothetical maximum. The outputs should look like this:

```sql
-- Query that reports current expected income from "big ticket" services
SELECT SUM(price)
  FROM services AS s
  INNER JOIN customers_services AS CS
          ON s.id = cs.service_id
  WHERE price > 100.00;

-- Query that reports hypothetical maximum income from "big ticket" services
SELECT SUM(price)
  FROM services
  CROSS JOIN customers
  WHERE price > 100.00;
```

**10	Deleting Rows**
> Write the necessary SQL statements to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database.

```sql
DELETE FROM customers_services
WHERE service_id = 7;

DELETE FROM services
  WHERE description = 'Bulk Email';

DELETE FROM customers
  WHERE name = 'Chen Ke-Hua';
```
