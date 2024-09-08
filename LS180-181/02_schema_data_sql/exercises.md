# Lesson 02: Schema, Data, and SQL

## Topic 02: The SQL Language

**1--What kind of programming language is SQL?**

SQL is a special purpose language, whose purpose is to interact with relational databases.

**2--What are the three sublanguages of SQL?**

1. Data definition language (DDL), which controls a relation's structure and rules with `CREATE`, `DROP`, and `ALTER`.
2. Data manipulation language (DML), which controls the data stored in a relation using `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.
3. Data control language (DCL), which controls accessibility and permissions of certain users, using `GRANT` and `REVOKE`.

**3--Write the following values as quoted string values that could be used in a SQL query.**
```
canoe
a long road
weren't
"No way!"
```
```sql
'canoe'
'a long road'
'weren''t'
'"No way!"'
```
**4--What operator is used to concatenate strings?**

`||`

**5--What function returns a lowercased version of a string? Write a SQL statement using it.**

`lower()`

```sql
SELECT lower('AbC');
```

**6--How does the `psql` console display true and false values?**

`t` and `f`

**7--The surface area of a sphere is calculated using the formula `A = 4πr^2`, where `A` is the surface area and `r` is the radius of the sphere.**

**Use SQL to compute the surface area of a sphere with a radius of 26.3cm, truncated to return an integer.**

SELECT trunc(4 * pi() * 26.3^2);
