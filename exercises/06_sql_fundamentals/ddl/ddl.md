# LS180 - SQL Fundamentals

## DDL

**1 - Create an Extrasolar Planetary Database**
> To get started, first create a postgresql database named "extrasolar", and then create two tables in the database as follows:

```sql
CREATE DATABASE extrasolar;

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) UNIQUE NOT NULL,
  distance INTEGER NOT NULL CHECK (distance > 0),
  spectral_type VARCHAR(1),
  companions INTEGER NOT NULL CHECK (companions >= 0)
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  designation VARCHAR(1) UNIQUE,
  mass INTEGER
);
```

**2	- Relating Stars and Planets**
> To correct this problem, add a `star_id` column to the `planets` table; this column will be used to relate each planet in the `planets` table to its home star in the `stars` table. Make sure the column is defined in such a way that it is required and must have a value that is present as an `id` in the `stars` table.

```sql
ALTER TABLE planets
  ADD COLUMN star_id INTEGER NOT NULL REFERENCES stars (id);
```

**3	- Increase Star Name Length**
> Hmm... it turns out that 25 characters isn't enough room to store a star's complete name. For instance, the star "Epsilon Trianguli Australis A" requires 30 characters. Modify the column so that it allows star names as long as 50 characters.

```sql
ALTER TABLE stars
  ALTER COLUMN name
  TYPE varchar(50);
```

**Further Exploration**
> Assume the `stars` table already contains one or more rows of data. What will happen when you try to run the above command? To test this, revert the modification and add a row or two of data:

If the constraint for column `name` is `character varying(25)` and we attempt to insert data where entry for `name` exceeds 25 characters in length, we get an error `ERROR:  value too long for type character varying(25)`.

If we change the data type for column `name` to accept longer strings (`character varying(25)`), then insert data where entry for `name` is up to 50 characters long, and then try to change the data type for column `name` back to `character varying(25)`, we get the same error `ERROR:  value too long for type character varying(25)`.

Conclusion: When deciding on data types for new columns, we must think ahead of any possible characteristics of data that'll be inserted in the future because changing data types of existing rows may affect the existing data in unintended ways.

**4	- Stellar Distance Precision**
> For many of the closest stars, we know the distance from Earth fairly accurately; for instance, Proxima Centauri is roughly 4.3 light years away. Our database, as currently defined, only allows integer distances, so the most accurate value we can enter is 4. Modify the `distance` column in the `stars` table so that it allows fractional light years to any degree of precision required.

```sql
ALTER TABLE stars
  ALTER COLUMN distance TYPE numeric;
```

**Further Exploration**
> Assume the `stars` table already contains one or more rows of data. What will happen when you try to run the above command? To test this, revert the modification and add a row or two of data:

No error would be thrown because the `numeric` data type without a specific precision or scale allows for an arbitrary number to be inserted, which includes integers (-2, -1, 0, 1, 2, etc.).

**5	- Check Values in List**
> The `spectral_type` column in the stars table is currently defined as a one-character string that contains one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'. However, there is currently no enforcement on the values that may be entered. Add a constraint to the table `stars` that will enforce the requirement that a row must hold one of the 7 listed values above. Also, make sure that a value is required for this column.

```sql
ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
  ALTER COLUMN spectral_type
    SET NOT NULL;
```

**Further Exploration**
> Assume the `stars` table contains one or more rows that are missing a `spectral_type` value, or that have an illegal value. What will happen when you try to alter the table schema? How would you go about adjusting the data to work around this problem. To test this, revert the modification and add some data:

If we attempt to add a constraint to the column `spectral_type` of `NOT NULL`, an error is thrown because there are currently `NULL` values in the column: `column "spectral_type" of relation "stars" contains null values`. In order to bypass this error, we'd have to first remove the rows with `NULL` values in column `spectral_type`, then add the constraint.

Now, if we attempt to add a CHECK constraint to the column `spectral_type` that limits entry of column data to 7 values, an error is thrown because the constraint is violated by a row of data that contains a value other than the 7 values listed in the CHECK constraint we're attemping to add. In order to bypass this error, we'd have to first remove the row containing the data violating the constraint, then add the constraint.

Note: An seamless way to delete those specific rows of data are to use the companion to `IN`, `NOT IN`, along with keyword `IS NULL`:

```sql
DELETE FROM stars
  WHERE (spectral_type NOT IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')
    OR spectral_type IS NULL;
```

**6	- Enumerated Types**
> Modify the `stars` table to remove the CHECK constraint on the `spectral_type` column, and then modify the `spectral_type` column so it becomes an enumerated type that restricts it to one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'.

```sql
ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
  ALTER COLUMN spectral_type TYPE spectral_type_enum
    USING spectral_type::spectral_type_enum;
```

**7	- Planetary Mass Precision**
> We will measure Planetary masses in terms of the mass of Jupiter. As such, the current data type of `integer` is inappropriate; it is only really useful for planets as large as Jupiter or larger. These days, we know of many extrasolar planets that are smaller than Jupiter, so we need to be able to record fractional parts for the mass. Modify the `mass` column in the `planets` table so that it allows fractional masses to any degree of precision required. In addition, make sure the mass is required and positive.

While we're at it, also make the `designation` column required.

```sql
ALTER TABLE planets
  ALTER COLUMN mass TYPE numeric,
  ALTER COLUMN mass SET NOT NULL,
  ADD CHECK (mass > 0),
  ALTER COLUMN designation SET NOT NULL;
```

**8	- Add a Semi-Major Axis Column**
> Add a `semi_major_axis` column for the semi-major axis of each planet's orbit; the semi-major axis is the average distance from the planet's star as measured in astronomical units (1 AU is the average distance of the Earth from the Sun). Use a data type of `numeric`, and require that each planet have a value for the `semi_major_axis`.

```sql
ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric NOT NULL;
```

> Further Exploration
Assume the `planets` table already contains one or more rows of data. What will happen when you try to run the above command? What will you need to do differently to obtain the desired result? To test this, delete the `semi_major_axis` column and then add a row or two of data (note: your `stars` table will also need some data that corresponds to the `star_id` values):

If we attempt to add a new column `semi_major_axis`, with a `NOT NULL` constraint, an error will be thrown stating that there are rows of data in the `planets` table that contain `NULL` values (`column "semi_major_axis" of relation "planets" contains null values`). 

To fix this...
1) Add the new column `semi_major_axis` without the `NOT NULL` constraint.

```sql
ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric;
```

2) Populate the `semi_major_axis` column with values - Update rows in the `planets` table to include `semi_major_axis` values.

```sql
UPDATE planets
  SET semi_major_axis = 0.04
    WHERE star_id = 1;

UPDATE planets
  SET semi_major_axis = 40
    WHERE star_id = 2;
```

3) Add the `NOT NULL` constraint to the `semi_major_axis` column.

```sql
ALTER TABLE planets
  ALTER COLUMN semi_major_axis 
    SET NOT NULL;
```

**9	- Add a Moons Table**
> Someday in the future, technology will allow us to start observing the moons of extrasolar planets. At that point, we're going to need a `moons` table in our `extrasolar` database. For this exercise, your task is to add that table to the database. The table should include the following data:

> Make sure you also specify any foreign keys necessary to tie each moon to other rows in the database.

```sql
CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  designation INTEGER NOT NULL CHECK (designation > 0), 
  semi_major_axis NUMERIC CHECK (semi_major_axis > 0),
  mass NUMERIC CHECK (mass > 0),
  planet_id INTEGER NOT NULL REFERENCES planets (id)
);
```

**10 - Delete the Database**
> Delete the extrasolar database. Use the psql console -- don't use the terminal level commands.

```sql
\c other_dbname

DROP DATABASE extrasolar;
```
