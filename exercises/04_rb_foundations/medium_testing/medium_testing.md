# RB 130 - Ruby Foundations: More Topics

## Medium Testing

### 1 - Classes to Test - Cash Register and Transaction

**Question:**

Create two new files, one for each of the two classes you will be testing throughout the remaining exercises.

---
### 2 - Setup the Test Class - Cash Register

**Question:**

Make a test suite for the `CashRegister` class. Set up the initial testing file for the `CashRegister` class. You don't need to include the actual tests yet, just the necessary setup (`require`s, test class, etc.).

**Solution:**

```ruby
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
end
```

**Discussion:**

To set up the test class for `CashRegister`, you need to:

1. Require necessary libraries and files:
   - `require 'minitest/autorun'` - `minitest/autorun` is the library that will give us access to the Minitest framework.
   - `require_relative 'cash_register'` and `require_relative 'transaction'` - `CashRegister` is the class we will be testing and `Transaction` is the class that it depends on. Since both of these classes are in their own separate files, two relative requires are necessary to gain access to the classes.

2. Define the test class.
   - `CashRegisterTest` - By Minitest convention, the test class is named with the name of the class we will be testing followed by "Test". The test class must inherits from `Minitest::Test` to ensure it’s recognized as a test class and not a plain Ruby class.

---
### 3 - Test Accept Money Method - Cash Register

**Question:**

Write a test for the `CashRegister#accept_money` method to confirm it correctly updates the total money in the register.

**Solution:**

```ruby
# LS-Provided Solution

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end
end
```

```ruby
# My Approach

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
  end

  def test_accept_money
    milk = Transaction.new(5)
    milk.amount_paid = 5

    @cash_register.accept_money(milk)
    assert_equal(105, @cash_register.total_money)
  end
end
```

**Discussion:**

The test for `#accept_money` should:
1. Create instances of `CashRegister` and `Transaction`.
2. Set `transaction.amount_paid`, via the `attr_accessor` to the amount being paid.
3. Compare `total_money` in the register before and after calling `#accept_money` with the transaction.

This test checks if `#accept_money` correctly increases `total_money` by `transaction.amount_paid`. Using `assert_equal`, it verifies that the register’s total money has increased by the expected amount after the method runs.


**Comparison of My Approach to the Original Solution:**

- **Setup Method**: By creating a `setup` method to initialize the register, my solution is more modular and efficient, especially if there are multiple tests. This eliminates the need to create a new `CashRegister` instance in every test, making the test suite more DRY (Don’t Repeat Yourself). This is useful for consistency, but in cases where only one test requires `@register`, I could initialize it locally within `test_accept_money`.
- **Explicit Value in `assert_equal`**:
   - Using `105` in `assert_equal` directly works well here, but if `@register`’s starting value changes in the `setup` method, I would need to remember to update this assertion as well.
   - To make the test adaptable, calculate the expected total dynamically:
     ```ruby
     assert_equal(@register.total_money + milk.amount_paid, @register.total_money)
     ```
- **Variable Naming:** Naming the `Transaction` instance `milk` is creative and helps illustrate a real-world use case, though using a name like `transaction` (as in the original solution) is slightly clearer for the intent of testing purposes.

**Updated Solution:**

```ruby
class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
  end
  
  def test_accept_money
    milk = Transaction.new(5)
    milk.amount_paid = 5
  
    previous_amount = @register.total_money
    @register.accept_money(milk)
    new_amount = @register.total_money

    assert_equal(previous_amount + milk.amount_paid, new_amount)
  end
end
```

---
### 4 - Test Change Method - Cash Register

**Question:**

Write a test for the method, `CashRegister#change`.

**Solution:**

```ruby
# LS-Provided Solution

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# Other tests omitted for brevity

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(30)
    transaction.amount_paid = 40

    assert_equal 10, register.change(transaction)
  end
end
```

```ruby
# My Approach

def setup
  @register = CashRegister.new(100)
end

def test_change
  transaction = Transaction.new(10)
  transaction.amount_paid = 13

  difference = transaction.amount_paid - transaction.item_cost
  
  assert_equal(difference, @register.change(transaction))
end
```

**Discussion:**

- **Approach:** Create a `CashRegister` instance with an initial amount, a `Transaction` instance with an item cost, and set an amount paid for the transaction greater than the item cost. Use `assert_equal` to verify that the change amount is correct.

**Comparison of My Approach to the Original Solution:**

- **Direct Calculation of Change**: Calculating `difference` in the test works fine, but the setup would be clearer if the expected change value were hardcoded in the assertion (e.g., `assert_equal(3, @register.change(transaction))`). Hardcoding the expected result directly makes it clear what the expected outcome should be, without needing to calculate it. Using a variable like `difference` is useful if the calculation is complex or reused, but here it’s a single, simple operation that doesn’t require an extra step.

**Update Solution - Version for better readability:**

```ruby
def setup
  @register = CashRegister.new(100)
end

def test_change
  transaction = Transaction.new(10)
  transaction.amount_paid = 13
  
  assert_equal(3, @register.change(transaction))
end
```

---
### 5 - Test Give Receipt Method - Cash Register

**Question:**

Write a test for method `CashRegister#give_receipt` that confirm that it displays a valid receipt.

**Solution:**

```ruby
# LS-Provided Solution

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  # Other tests omitted for brevity

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end
```

```ruby
# My Approach

def setup
  @register = CashRegister.new(100)
end

def test_give_receipt
  transaction = Transaction.new(14)

  assert_output("You've paid $14.\n") {@register.give_receipt(transaction)}
end
```

**Discussion:**
- To test for expected output in `give_receipt`, we use `assert_output`. This method takes the expected output string as an argument and compares it to actual output captured from the block. The expected output includes a newline character, accounting for the behavior of the `puts` method, which automatically adds a newline after printing a message.

**Comparison of My Approach to the Original Solution:**

- **Readability**: The solution provided sets the item cost in a variable `item_cost` (`item_cost = 14`). While not strictly necessary, it improves readability by clarifying that this value relates to the transaction's item cost.

---
### 6 - Test Prompt For Payment Method- Transaction

**Question:**

Write a test that verifies that `Transaction#prompt_for_payment` sets the `amount_paid` correctly. The `Transaction#prompt_for_payment` method has been modified to make testing easier, allowing for simulated user input. It now reads:

```ruby
def prompt_for_payment(input: $stdin)
  loop do
    puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end
```

**Explanation:**

- **Changes:** The `prompt_for_payment` method now takes a keyword parameter, `input`, with a default value of `$stdin`.
- **What is `$stdin`?** `$stdin` is a global variable that Ruby uses to represents the **standard input stream**, or the default source of input, which is usually the keyboard. Thus, writing `str = gets.chomp` is equivalent to `str = $stdin.gets.chomp`.
- **Purpose of `$stdin`:** By using `$stdin`, we can control the source of input, which is essential for testing interactive programs. The method can read input from other sources (e.g., a simulated input during testing) rather than always relying on keyboard input. Interactive methods like `prompt_for_payment`, which rely on user input, can’t be directly tested with keyboard input during automated testing. Instead, input must be mocked.

**Testing with Simulated Input Using StringIO:**

In this exercise, we'll need to simulate -- mock -- the user input. Our tests need to be automated, so we can't prompt the user with `Kernel#gets`. One way to do that is to pass a "string stream" to the method as the input parameter. `StringIO` is a class in Ruby that allows strings to be used as input/output streams, simulating keyboard input.

To use it, create a `StringIO` object that contains all of your simulated keyboard inputs, then pass it to `prompt_for_payment`. For instance:

```ruby
input = StringIO.new("30\n")
transaction.prompt_for_payment(input: input)
```

Here, the `StringIO` object acts as if the user entered `30` and pressed Return (`\n`). Using `StringIO` allows `prompt_for_payment` to receive input from this object, emulating user input without manual typing.

**Solution:**

```ruby
# LS-Provided Solution

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end
```

```ruby
# My Approach

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(25)
    input = StringIO.new("35\n")
    transaction.prompt_for_payment(input: input)

    assert_equal(35, transaction.amount_paid)
  end
end
```

---
### 7 - Alter Prompt For Payment Method - Transaction

**Question:**

In this exercise, the goal is to clean up output from the `Transaction#prompt_for_payment` method when running a test. The initial test included some extraneous console output from the `puts` calls in `prompt_for_payment`. Suppress this output (without removing the `puts` calls) so only the test results display.

**Solution:**

```ruby
# Modified TransactionTest class

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new("35\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal(35, transaction.amount_paid)
  end
end
```

```ruby
# Modified prompt_for_payment method

def prompt_for_payment(input: $stdin, output: $stdout)
  loop do
    puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end
```

**Discussion:** 

- **Using `StringIO` to Mock Output:** Similar to how `StringIO` was previously used to simulate user input, `StringIO` can also be used to capture output. By creating a mock output object with `StringIO`, `puts` calls in `Transaction#prompt_for_payment` can write to this mock object instead of displaying on the console.
- **Updating `prompt_for_payment` Method:** The `Transaction#prompt_for_payment` method needs a new `output` parameter to specify where to send the output. By default, this parameter is `$stdout` (console), but during tests, it will accept the `StringIO` mock.
- **Implementing the Solution:** 
  - In the `prompt_for_payment` method, we add an `output` parameter with a default value of `$stdout`. Both `input` and `output` are passed as arguments to simulate a payment amount and to capture output, preventing any actual console display.
  - Also in `prompt_for_payment`, we replace direct `puts` calls with `output.puts`, allowing flexibility to redirect output either to the console or to a mock object.
  - In the test, `StringIO` objects for both `input` (user input) and `output` (console output) are instantiated.
- **Explanation of Results:** When the test runs with the `StringIO` mock, only the minitest summary is displayed. This solution provides automated testing without manual input while keeping minitest output clean and focused on test results.

---
### 9 - Test swap method - Text

**Question:**

Write a test for the `Text#swap` method to ensure it correctly replaces all instances of a specified letter ('a') with another letter ('e'). 

You are provided with:
1. A sample text file.
2. A `Text` class, which reads the content of the sample text file as a string.

The test suite should handle file operations in a way that maintains clean code separation by using `#setup` and `#teardown` methods.

**Solution:**

```ruby
# LS-Provided Solution

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def teardown
    @file.close
  end
end
```

```ruby
# My Approach

# text_test.rb

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @contents = File.read("sample_text.txt")
  end

  def test_swap
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    actual_text = Text.new(@contents).swap('a', 'e')

    assert_equal(expected_text, actual_text)
  end
end
```

**Discussion:**

- **Setting Up the File for Testing:** The `#setup` method handles opening the sample text file in read mode and assigning the file object to an instance variable (`@file`). `@file` will then be available to each test, ensuring that the file is open and ready for reading.
- **Writing the `test_swap` Method:**
   - Create a `Text` object by passing the contents of `@file.read` as an argument.
   - Call `#swap('a', 'e')` on this object to replace all 'a's with 'e's.
   - Define an `expected_text` string that represents what the file’s contents should look like after replacing 'a' with 'e'. This expected output is generated by manually editing the original file content to substitute all 'a' characters with 'e'.
   - Use `assert_equal` to compare `expected_text` with the actual output from `Text#swap`, verifying that the method produces the correct output.
-  **Cleaning Up with `#teardown`:** The `#teardown` method handles closing the file opened in `#setup`. This ensures that the file is properly closed after each test, maintaining good resource management and preventing potential file lock issues.

**Comparison of My Approach with LS-Provided Solution:**
- I use `File.read('sample_text.txt')` in my setup method, which is correct and simpler in that I just load the contents of the file without keeping it open during the test. This reduces the need for a `teardown` method to close the file.
- **Difference Between `File.read` and `File.open`:** `File.read` reads the entire contents of a file in one go and closes the file immediately. This is ideal for situations where you don’t need to perform multiple operations on the file after reading it. `File.open` opens the file and keeps it open, allowing for more flexible file handling (e.g., reading/writing in stages). With `File.open`, you typically need to remember to close the file.
- **When to Use Each Approach:** Use `File.read` when you need to load the file contents just once and don’t need the file open afterward. It’s simpler and keeps the code clean.
Use `File.open` if you need to keep the file open for multiple reads/writes, or if you're processing a very large file in chunks to avoid loading everything into memory at once.

---
### 10 - Test word_count method - Text

**Question:**

In this assignment, a new method, `word_count`, is added to the existing `Text` class. Write a test for this method to verify its functionality. The focus is on demonstrating the benefits of `setup` and `teardown` methods in organizing test-related file operations, especially when running multiple tests on the same class.

**Solution:**

```ruby
# LS-Provided Solution

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  # omitted for brevity

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
  end
end
```

```ruby
# My Approach

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @contents = File.read('sample_text.txt')
  end

  def test_word_count
    text = Text.new(@contents)

    assert_equal(72, text.word_count)
  end
end
```

**Discussion:**

Steps:
- Add a test for the `word_count` method in the `TextTest` test suite.
- Ensure that `setup` and `teardown` methods handle file-related operations.
- Use `assert_equal` to verify that the actual word count matches the expected count.

**Explanation of LS-Provided Solution:**

- **`setup` Method:** Opens the `sample_text.txt` file and assigns it to the instance variable `@file`. This method runs before each test, ensuring that each test has access to the file contents.
- **`test_word_count`:** 
  - Reads the content from `@file` and passes it to an instance of `Text`.
  - Calls `word_count` on the `Text` instance and uses `assert_equal` to check that the word count is correct.
  - The expected count (in this example, `72`) is pre-calculated and used as the assertion’s expected value.
- **`teardown` Method**: Closes the file after each test to prevent file handle leaks. This method is particularly useful for tests involving multiple files, ensuring that files are opened and closed correctly.

**Comparison of My Approach with LS-Provided Solution:**

- My approach works but differs from the assignment’s focus on setup/teardown. Using `File.open` with teardown would better demonstrate those methods since that’s a learning goal.
- To align with the assignment’s emphasis on setup and teardown, I'll rewrite my solution like this:

```ruby
require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @contents = File.open('sample_text.txt', 'r')
  end

  def test_word_count
    text = Text.new(@contents.read)

    assert_equal(72, text.word_count)
  end

  def teardown
    @contents.close
  end
end
```

**Verifying that the file is closed after each test:**

Ruby’s `IO` class has built-in safeguards to close files after scripts complete, but explicitly closing files in `teardown` ensures that resources are properly released. Additionally, including a line like `puts "File has been closed: #{@file.closed?}"` can verify the file is closed after each test.

When running this test file, two outputs are displayed:
1. The `Minitest` test results.
2. Output from `puts` in `teardown`, confirming that the file is closed after each test run.

```ruby
def teardown
  @file.close
  puts "File has been closed: #{@file.closed?}"
end
```
