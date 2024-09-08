# LS180 - SQL Fundamentals

## DML/DDL/DCL

**1 - DML/DDL/DCL Part 1** 
> Name and define the remaining 2 sublanguages, and give at least 2 examples of each.

Data Definition Language (DDL) is a component of SQL used to describe the structure of a database (schema) using the keywords `CREATE`, `ALTER`, AND `DROP`.

Data Manipulation Language (DML) is a component of SQL used to manipulate the data stored in a database using the keywords `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.

**2 - DML/DDL/DCL Part 2**
> Does the following statement use the Data Definition Language (DDL) or the Data Manipulation Language (DML) component of SQL?

`SELECT` queries the data in a database. Because it manipulates the *data* in the database, it is part of the the DML component of SQL.

**3 - DML/DDL/DCL Part 3**
> Does the following statement use the DDL or DML component of SQL?

`CREATE TABLE` defines the type of information stored in a database by describing its data and attributes. Because it manipulates the *schema* of the database, it is part of the DDL component of SQL.

**4 - DML/DDL/DCL Part 4**
> Does the following statement use the DDL or DML component of SQL?

`ALTER TABLE` modifies the characteristics and attributes of a table. Because it manipulates the *schema* of the database, it uses the DDL component of SQL.

**5 - DML/DDL/DCL Part 5**
> Does the following statement use the DDL or DML component of SQL?

`INSERT` adds new rows of data into a database. Because it manipulates the *data* of a database, it uses the DML component of SQL.

**6 - DML/DDL/DCL Part 6**
> Does the following statement use the DDL or DML component of SQL?
`UPDATE` modifies specific rows of data in a database. Because it manipulates the *data* in the database, it uses the DML component of SQL. 

**7 - DML/DDL/DCL Part 7**
> Does the following statement use the DDL, DML, or DCL component of SQL?

This is a psql meta-command used in a psql console and is not part of SQL.

**8 - DML/DDL/DCL Part 8**
> Does the following statement use the DDL or DML component of SQL?

`DELETE FROM` removes specific rows of data from a database. Because it manipulates the *data* in a database, it uses the DML component of SQL.

**9 - DML/DDL/DCL Part 9**
> Does the following statement use the DDL or DML component of SQL?

`DROP DATABASE` removes a database from the list of databases in the psql server. Because it manipulates the *schema* of the database, it uses the DDL component of SQL.

**10 - DML/DDL/DCL Part 10**
> Does the following statement use the DDL or DML component of SQL?

`CREATE SEQUENCE` creates a new sequence object in a database. Because it manipulates the *schema* of a database, it uses the DDL component of SQL.
