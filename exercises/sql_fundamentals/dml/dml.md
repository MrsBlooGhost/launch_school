# LS180 - SQL Fundamentals

## DML


**1 -	Set Up Database**
> Create a database to store information and tables related to this workshop.

```sql
CREATE DATABASE workshop;

\c workshop

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices (id)
);
```

**2 -	Insert Data for Parts and Devices**
> Now that we have the infrastructure for our workshop set up, let's start adding in some data. Add in two different devices. One should be named, "Accelerometer". The other should be named, "Gyroscope".

The first device should have 3 parts (this is grossly simplified). The second device should have 5 parts. The part numbers may be any number between 1 and 10000. There should also be 3 parts that don't belong to any device yet.

```sql
INSERT INTO devices (name)
  VALUES ('Accelerometer'),
         ('Gyroscope');

INSERT INTO parts (part_number, device_id)
  VALUES (301, 1),
         (302, 1),
         (303, 1),
         (501, 2),
         (502, 2),
         (503, 2),
         (504, 2),
         (505, 2),
         (001, NULL),
         (002, NULL),
         (003, NULL);
```

**3 -	INNER JOIN**
> Write an SQL query to display all devices along with all the parts that make them up. We only want to display the name of the `devices`. Its parts should only display the `part_number`.

```sql
SELECT d.name, p.part_number
  FROM devices AS d
  INNER JOIN parts AS p
    ON d.id = p.device_id;
```

**4 -	SELECT part_number**
> We want to grab all parts that have a `part_number` that starts with 3. Write a `SELECT` query to get this information. This table may show all attributes of the `parts` table.

```sql
SELECT * 
  FROM parts
  WHERE part_number::text LIKE '3%';
```

**5 -	Aggregate Functions**
> Write an SQL query that returns a result table with the name of each device in our database together with the number of parts for that device.

```sql
SELECT d.name, COUNT(p.device_id)
FROM devices AS d
  LEFT OUTER JOIN parts AS p
    ON d.id = p.device_id
  GROUP BY d.name;
```

**6 -	ORDER BY**
> Alter the SQL query above so that we get a result table that looks like the following.


```sql
SELECT d.name, COUNT(p.device_id)
FROM devices AS d
  LEFT OUTER JOIN parts AS p
    ON d.id = p.device_id
  GROUP BY d.name
  ORDER BY d.name DESC;
```

**7 -	IS NULL and IS NOT NULL**
> Write two SQL queries: 
> One that generates a listing of parts that currently belong to a device.
> One that generates a listing of parts that don't belong to a device.
> Do not include the `id` column in your queries.

```sql
-- Listing of parts that currently belong to a device
SELECT part_number, device_id
  FROM parts
  WHERE device_id IS NOT NULL;

-- Listing of parts that don't belong to a device
SELECT part_number, device_id
  FROM parts
  WHERE device_id IS NULL;
```

**8 -	Oldest Device**
> Insert one more device into the `devices` table. You may use this SQL statement or create your own.
> Assuming nothing about the existing order of the records in the database, write a SQL statement that will return the name of the oldest device from our `devices` table.

```sql
SELECT name AS oldest_device
  FROM devices
  ORDER BY created_at ASC
  LIMIT 1;
```

> Further Exploration: What do you think would happen if we had two devices with the same `created_at` value that happened to be the oldest timestamp? How might this affect what we can infer from the data we get when using a `LIMIT` clause? Try inserting two devices with the same `INSERT` statement, and then find the 'newest' device using `ORDER BY` and `LIMIT`.

**9 -	UPDATE device_id**
> We've realized that the last two parts we're using for device number 2, "Gyroscope", actually belong to an "Accelerometer". Write an SQL statement that will associate the last two `parts` from our parts table with an "Accelerometer" instead of a "Gyroscope".

```sql
UPDATE parts
  SET device_id = 1
  WHERE id IN (11, 12);
```

> Further Exploration: What if we wanted to set the part with the smallest `part_number` to be associated with "Gyroscope"? How would we go about doing that?

**1 -0	Delete Accelerometer**
> Our workshop has decided to not make an Accelerometer after all. Delete any data related to "Accelerometer", this includes the parts associated with an Accelerometer.

```sql
DELETE FROM parts
  WHERE device_id = 1;
  
DELETE FROM devices
  WHERE name = 'Accelerometer';
```
