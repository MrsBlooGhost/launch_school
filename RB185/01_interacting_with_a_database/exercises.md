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

Line 20 is the beginning of a heredoc (short for "here document") block. A heredoc is a way to define multi-line strings in a more readable way when writing a large block of text. The `<<` operator starts the heredoc, followed by an arbitrary `INDENTIFIER` label and a closing `IDENTIFIER` that must match the opening one. The squiggly heredoc (`<<~`) strips leading whitespace from the beginning of each line in the heredoc block. This allows us to indent the content and the closing identifier in a natural, readable way.

The rule for stripping enough whitespace: The indentation of the least-indented line will be removed from each line of the content.

## Topic 10: Adding Expenses

> Requirements:
> 1. Add a command, `add`, that can be used to add new expenses to the system. It should look like this in use:
> 2. Make sure that this command is always passed any additional parameters needed to add an expense. If it isn't display an error message:

> Implementation:
> - [x] Check to see if the first argument passed to the program is `add`. If it is, check to make sure that two more arguments were also passed. If they weren't, print out an error message and exit.
> - [x] Call a new method, `add_expense`, that accepts the two passed arguments. This method should execute a SQL statement to insert a new row into the `expenses` table.

```ruby
#! /usr/bin/env ruby

require 'pg'

# Adding a constant here allows us to access the connection from within both list_expenses and add_expense. This is a sign that we were missing an object in our design.
CONNECTION = PG.connect(dbname: "expenses")

def list_expenses
  result = CONNECTION.exec("SELECT * FROM expenses ORDER BY created_on;")

  result.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"] ]

    puts columns.join(" | ")
  end
end

def add_expense(amount, memo)
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES (#{amount}, '#{memo}', CURRENT_DATE)"

  CONNECTION.exec(sql)
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
elsif cmd == "add"
  amount = ARGV[1]
  memo = ARGV[2]
  puts amount && memo ? add_expense(amount, memo) : abort("You must provide an amount and memo.")
else
  display_help
end
```

> Can you see any potential issues with the Solution code above?

Our code uses string interpolation to build the SQL statement. If we try to add a memo containing an apostrophe (e.g. `Hershey's Chocolate`), an error arises and we aren't able to add the expense.

## Topic 11: Handling Parameters Safely

> What happens if you use two placeholders in the first argument to `PG::Connection#exec_params`, but only one in the Array of values used to fill in those placeholders?

A `PG::ProtocolViolation` error will be raised.

```
irb(main):005> connection.exec_params("SELECT 1 + $1 + $2", [1]).values
(irb):5:in `exec_params': ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2 (PG::ProtocolViolation)
```

> Update the code within the `add_expense` method to use `exec_params` instead of `exec`.

```ruby
def add_expense(amount, memo)
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"

  CONNECTION.exec_params(sql, [amount, memo, Date.today])
end
```

> What happens when the same malicious arguments are passed to the program now?

The malicious input is now treated as data, preventing SQL injection.

## Topic 12: Code Structure

> Requirements:
> 1. Update the code so it falls in line with the design described in the above video.

> Implementation:
> - [x] Move the add_expense and list_expenses methods into a new class, `ExpenseData`.
> - [x] Change the `CONNECTION` constant to an instance variable. We want to have a clear separation of responsibilities for our application. We want to ensure that access to the database connection is restricted to `ExpenseData`, since we're encapsulating database interaction within `ExpenseData`.
> - [x] Move the parameter handling into a new class, `CLI` with an instance method `CLI#run`. Create an instance of `ExpenseData` in CLI#initialize.
> - [x] Create a new instance of `CLI` and call `run` on it, passing `ARGV`.

```ruby
#! /usr/bin/env ruby

require 'pg'
require 'date'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on;")

    result.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end

  def add_expense(amount, memo)
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"

    @connection.exec_params(sql, [amount, memo, Date.today])
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    cmd = arguments.shift
    case cmd
    when "list"
      @application.list_expenses
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort("You must provide an amount and memo.") unless amount && memo
      @application.add_expense(amount, memo)
    else
      display_help
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
end

CLI.new.run(ARGV)
```

## Topic 13: Searching Expenses

> Requirements:
> 1. Allow users to search for expenses that match a specified term:

> Implementation:
> - [x] Add a new method, `search_expenses`, to `ExpenseData`. This method should accept a single argument.
> - [x] Within `search_expenses`, execute a SQL statement that uses `ILIKE` to retrieve matching expenses.
> - [x] Display matching expenses on the screen by extracting the expense display code from `list_expenses`.


```ruby
#! /usr/bin/env ruby

require 'pg'
require 'date'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on;")

    result.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end

  def add_expense(amount, memo)
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"

    @connection.exec_params(sql, [amount, memo, Date.today])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}"])
    display_expenses(result)
  end

  private

  def display_expenses(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    cmd = arguments.shift
    case cmd
    when "list"
      @application.list_expenses
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort("You must provide an amount and memo.") unless amount && memo
      @application.add_expense(amount, memo)
    when "search"
      @application.search_expenses(arguments[0])
    else
      display_help
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
end

CLI.new.run(ARGV)
```

## Topic 14: Deleting Expenses

> Requirements:
> 1. Allow users to delete specific expenses from the system.
> 2. If a user attempts to delete an expense that doesn't exist, an appropriate message should be displayed:

> Implementation:
> - [x] Add a new method, `delete_expense`, to `ExpenseData`. This method should accept a single argument, which should be the id of the expense to delete.
> - [x] Modify `CLI#run` to handle the new `delete` command.
> - [x] Within `delete_expense`, execute a SQL statement to fetch the expense with the specified id.
> - [x] If a matching expense is returned, execute a SQL statement to delete it. Then display a message saying it was deleted and the deleted expense's information.
> - [x] If a matching expense is not returned, display a message stating that fact.

```ruby
#! /usr/bin/env ruby

require 'pg'
require 'date'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on;")

    result.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end

  def add_expense(amount, memo)
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"

    @connection.exec_params(sql, [amount, memo, Date.today])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}"])
    display_expenses(result)
  end

  def delete_expense(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])

    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id = $1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'."
    end
  end

  private

  def display_expenses(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    cmd = arguments.shift
    case cmd
    when "list"
      @application.list_expenses
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort("You must provide an amount and memo.") unless amount && memo
      @application.add_expense(amount, memo)
    when "search"
      @application.search_expenses(arguments[0])
    when "delete"
      @application.delete_expense(arguments[0])
    else
      display_help
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
end

CLI.new.run(ARGV)
```

## Topic 15: Clearing Expenses

> Requirements:
> 1. A user can remove all expenses from the system using a new command, `clear`.
> 2. Before deleting all expenses, the program should prompt the user to verify they wish to continue:
> 3. If the user presses `n`, then the program should exit without deleting any data:
> 4. If the user presses `y`, all expenses should be deleted a message should be shown:

> Implementation:
> - [ ] Add a new method, `delete_all_expenses`, to `ExpenseData`.
> - [ ] Modify `CLI#run` to handle the new `clear` command. Print a warning message, and wait for the user to press a key.
> - [ ] If the user presses the `y` key, call the new `delete_all_expenses`.
> - [ ] If the user presses any other key, abort program execution.

```ruby
#! /usr/bin/env ruby

require 'pg'
require 'date'
require 'io/console'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on;")

    result.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end

  def add_expense(amount, memo)
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"

    @connection.exec_params(sql, [amount, memo, Date.today])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}"])
    display_expenses(result)
  end

  def delete_expense(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])

    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id = $1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'."
    end
  end

  def delete_all_expenses
    @connection.exec_params("DELETE FROM expenses")
    puts "All expenses have been deleted."
  end

  private

  def display_expenses(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    cmd = arguments.shift
    case cmd
    when "list"
      @application.list_expenses
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort("You must provide an amount and memo.") unless amount && memo
      @application.add_expense(amount, memo)
    when "search"
      @application.search_expenses(arguments[0])
    when "delete"
      @application.delete_expense(arguments[0])
    when "clear"
      puts "This will remove all expenses. Are you sure? (y/n)"
      response = $stdin.getch
      response == 'y' ? @application.delete_all_expenses : abort
    else
      display_help
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
end

CLI.new.run(ARGV)
```

## Topic 16: Counting and Totaling Expenses

> Requirements:
> 1. The `list` command should display a count of expenses in addition to the total of all expenses:
> 2. If there is only one expense, the output should use appropriate grammar:
> 3. Additionally, if there are no expenses (which is much more possible now that we've implemented the `clear` command), an appropriate message should be shown:
> 4. The same behaviors should be provided by the `search` command:

> Implementation:
> - [ ] Add a new method, `ExpenseData#display_count`, that takes a single argument. This argument should be a `PG::Result` object. If there are rows in the result object, display the "There are n expenses." message. If not, display the "There are no expenses" message.
> - [ ] Modify `ExpenseData#display_expenses` to calculate the total amount for all rows and display it after listing each expense.

```ruby
#! /usr/bin/env ruby

require 'pg'
require 'date'
require 'io/console'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on;")

    display_count(result)
    display_expenses(result) if result.ntuples > 0
  end

  def add_expense(amount, memo)
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"

    @connection.exec_params(sql, [amount, memo, Date.today])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}"])
    display_count(result)
    display_expenses(result) if result.ntuples > 0
  end

  def delete_expense(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])

    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id = $1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'."
    end
  end

  def delete_all_expenses
    @connection.exec_params("DELETE FROM expenses")
    puts "All expenses have been deleted."
  end

  private

  def display_expenses(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end

    amount_sum = expenses.field_values("amount").map(&:to_f).inject(:+)

    puts "-" * 50
    puts "Total #{format('%.2f', amount_sum.to_s).rjust(25)}"
  end

  def display_count(expenses)
    count = expenses.ntuples

    if count == 0
      puts "There are no expenses."
    elsif count == 1
      puts "There is 1 expense."
    else
      puts "There are #{count} expenses." 
    end
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    cmd = arguments.shift
    case cmd
    when "list"
      @application.list_expenses
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort("You must provide an amount and memo.") unless amount && memo
      @application.add_expense(amount, memo)
    when "search"
      @application.search_expenses(arguments[0])
    when "delete"
      @application.delete_expense(arguments[0])
    when "clear"
      puts "This will remove all expenses. Are you sure? (y/n)"
      response = $stdin.getch
      response == 'y' ? @application.delete_all_expenses : abort
    else
      display_help
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
end

CLI.new.run(ARGV)
```

## Topic 17: Creating the Schema Automatically

> Requirements:
> 1. When a user runs the `expense` program for the first time, it should automatically create any tables it needs within the `expenses` database (notice there are no errors):

> Implementation:
> Add a new method, `setup_schema` to `ExpenseData`. Call this method inside `ExpenseData#initialize`.
> Inside `setup_schema`, use the query described above to see if the `expenses` table already exists. If it doesn't, create it.

```ruby
#! /usr/bin/env ruby

require "pg"
require "io/console"

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
    setup_schema
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
    display_count(result)
    display_expenses(result) if result.ntuples > 0
  end

  def add_expense(amount, memo)
    date = Date.today
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
    @connection.exec_params(sql, [amount, memo, date])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}%"])
    display_count(result)
    display_expenses(result) if result.ntuples > 0
  end

  def delete_expense(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])

    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id=$1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'."
    end
  end

  def delete_all_expenses
    @connection.exec("DELETE FROM expenses")
    puts "All expenses have been deleted."
  end

  private

  def display_count(expenses)
    count = expenses.ntuples
    if count == 0
      puts "There are no expenses."
    else
      puts "There are #{count} expense#{"s" if count != 1}."
    end
  end

  def display_expenses(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")
    end

    puts "-" * 50

    amount_sum = expenses.inject(0) do |sum, tuple|
      sum + tuple["amount"].to_f
    end

    puts "Total #{amount_sum.to_s.rjust(25)}"
  end

  def setup_schema
    result = @connection.exec <<~SQL
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = 'public' AND table_name = 'expenses';
    SQL

    if result[0]["count"] == "0"
      @connection.exec <<~SQL
        CREATE TABLE expenses (
          id serial PRIMARY KEY,
          amount numeric(6,2) NOT NULL CHECK (amount >= 0.01),
          memo text NOT NULL,
          created_on date NOT NULL
        );
      SQL
    end
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(arguments)
    command = arguments.shift
    case command
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort "You must provide an amount and memo." unless amount && memo
      @application.add_expense(amount, memo)
    when "delete"
      @application.delete_expense(arguments[0])
    when "clear"
      puts "This will remove all expenses. Are you sure? (y/n)"
      response = $stdin.getch
      @application.delete_all_expenses if response == "y"
    when "list"
      @application.list_expenses
    when "search"
      @application.search_expenses(arguments[0])
    else
      display_help
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
end

CLI.new.run(ARGV)
```
