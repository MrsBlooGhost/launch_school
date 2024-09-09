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
