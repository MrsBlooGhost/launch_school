# Lesson 01: Interacting with a Database in Code

## Topic 07: Database Design

> Create a database to store the expenses managed by this project.
> - [x] Design a table called `expenses` that can hold the data for expenses.
> - [x] This table should have columns named `id`, `amount`, `memo`, and `created_on`.
> - [x] Write the SQL to create that table into a file called `schema.sql`.
> - [x] Create a database and use `schema.sql` to setup the database for the application.

```sql
-- schema.sql
CREATE TABLE expenses (
  id SERIAL PRIMARY KEY,
  amount DECIMAL(6,2) NOT NULL,
  memo TEXT NOT NULL,
  created_on DATE NOT NULL
);
```

```
$ createdb expenses
$ psql -d expenses < schema.sql
```

> What is the largest value that can be stored in the amount column? Use psql to illustrate what it is.

9999.99

```sql
expenses=# INSERT INTO expenses (amount, memo, created_on)
VALUES (9999.99, 'test', CURRENT_DATE);
INSERT 0 1
```

> What is the smallest value that can be stored in the amount column? Use psql to illustrate what it is.

-9999.99

```sql
expenses=# INSERT INTO expenses (amount, memo, created_on)
VALUES (-9999.99, 'test', CURRENT_DATE);
INSERT 0 1
```

> Add a check constraint to the expenses table to ensure that amount only holds a positive value.

```sql
expenses=# ALTER TABLE expenses
  ADD CONSTRAINT positive_amount CHECK (amount > 0);

ERROR:  check constraint "positive_amount" of relation "expenses" is violated by some row

expenses=# SELECT * FROM expenses;

 id |  amount  | memo | created_on 
----+----------+------+------------
  1 |  9999.99 | test | 2024-10-08
  2 |     0.00 | test | 2024-10-08
  3 | -9999.99 | test | 2024-10-08
(3 rows)

expenses=# DELETE FROM expenses WHERE id = 3; 

DELETE 1

expenses=# SELECT * FROM expenses;

 id | amount  | memo | created_on 
----+---------+------+------------
  1 | 9999.99 | test | 2024-10-08
  2 |    0.00 | test | 2024-10-08
(2 rows)

expenses=# DELETE FROM expenses WHERE id = 2;

DELETE 1

expenses=# ALTER TABLE expenses
  ADD CONSTRAINT positive_amount CHECK (amount > 0);
```

## Topic 08: Listing Expenses

> Connect to the `expenses` database and print out the information for all expenses in the system.
> - [x] Create a connection to the database.
> - [x] Execute a query to retrieve all rows from the `expenses` table, ordered from oldest to newest.
> - [x] Iterate through each result row and print it to the screen. The result should look like this:

```ruby
#! /usr/bin/env ruby

require 'pg'

connection = PG.connect(dbname: "expenses")
result = connection.exec("SELECT * FROM expenses ORDER BY created_on;")

result.each do |tuple|
  columns = [ tuple["id"].rjust(3),
              tuple["created_on"].rjust(10),
              tuple["amount"].rjust(12),
              tuple["memo"]
            ]

  puts columns.join(" | ")
end
```

## Topic 09: Displaying Help

> Display a list of expenses when passed the list argument, and help content otherwise.
> - [x] Move the existing expense listing code into a method.
> - [x] Add a new method that prints out the help content.
> - [x] Check the value of the first argument passed to the program, and call the appropriate method.

```ruby
#! /usr/bin/env ruby

require 'pg'

def list_expenses
  connection = PG.connect(dbname: "expenses")
  result = connection.exec("SELECT * FROM expenses ORDER BY created_on;")

  result.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"] ]

    puts columns.join(" | ")
  end
end

def display_help
  puts <<~HELP
    An expense recording system

    Commands:
    
    add AMOUNT MEMO - record a new expense
    clear - delete all expenses
    list - list all expenses
    delete NUMBER - remove expense with id NUMBER
    search QUERY - list expenses with a matching memo field
  HELP
end

cmd = ARGV[0]
if cmd == "list"
  list_expenses
else
  display_help
end
```

> Describe what is happening on line 20 of the Solution shown above.

Line 20 is the beginning of a heredoc (short for "here document") block. A heredoc is a way to define multi-line strings in a more readable way when writing a large block of text. The `<<` operator starts the heredoc, followed by an arbitrary `INDENTIFIER` label and a closing `IDENTIFIER` that must match the opening one. The squiggly heredoc (`<<~`), which we use in the solution, strips leading whitespace from the beginning of each line in the heredoc block. This allows us to indent the content and the closing identifier in a natural, readable way.

The rule for stripping enough whitespace: The indentation of the least-indented line will be removed from each line of the content.
