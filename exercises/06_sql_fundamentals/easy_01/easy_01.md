# LS180 - SQL Fundamentals

## Easy 01

**1	- Create a Database**
> Create a new database called `animals`.

`$ createdb animals`

or from psql console:

```sql
CREATE DATABASE animals;
```

**2	- Create a Table**
> Make a table called `birds`. It should have the following fields:

```sql
CREATE TABLE birds (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  age INTEGER,
  species VARCHAR(15)
);
```

**3	- Insert Data**
> For this exercise, we'll add some data to our `birds` table. Add five records to this database so that our data looks like:

```sql
INSERT INTO birds (name, age, species)
  VALUES ('Charlie', 3, 'Finch'),
         ('Allie', 5, 'Owl'),
         ('Jennifer', 3, 'Magpie'),
         ('Jamie', 4, 'Owl'),
         ('Roy', 8, 'Crow');
```

**4	- Select Data**
> Write an SQL statement to query all data that is currently in our `birds` table.

```sql
SELECT * FROM birds;
```

or

```sql
SELECT id, name, age, species FROM birds;
```

**5	- WHERE Clause**
> Using a `WHERE` clause, `SELECT` records for birds under the age of 5.

```sql
SELECT *
  FROM birds
  WHERE age < 5;
```

**6	- Update Data**
> Update the `birds` table so that the rows with a species of `'Crow'` now read `'Raven'`.

```sql
UPDATE birds
  SET species = 'Raven'
  WHERE species = 'Crow';
```

> Oops. Jamie isn't an Owl - he's a Hawk. Correct his information.

```sql
UPDATE birds
  SET species = 'Hawk'
  WHERE name = 'Jamie';
```

**7	- Delete Data**
> Write an SQL statement that deletes the record that describes a 3 year-old finch.

```sql
DELETE FROM birds
  WHERE age = 3 AND species = 'Finch';
```

**8	- Add Constraint**
> For this exercise, write some code that ensures that only birds with a positive age may be added to the database. Then write and execute an SQL statement to check that this new constraint works correctly.

```sql
ALTER TABLE birds
ADD CONSTRAINT age_check CHECK (age > 0);
```

```sql
INSERT INTO birds (name, age, species)
  VALUES ('Birdie', -1, 'Hawk');
```

**9	- Drop Table**
> Write an SQL statement that will drop the `birds` table and all its data from the `animals` database.

```sql
DROP TABLE birds;
```

**10 - Drop Database**
> Write a SQL statement or PostgreSQL command to drop the `animals` database.

First, we have to disconnect from the `animals` database by connecting to a different database. Then:

```sql
DROP DATABASE animals;
```

Or we could exit the psql console and do:

`$ dropdb animals`
