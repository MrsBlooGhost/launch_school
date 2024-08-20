# We first need to require all necessary libraries and files.
# "minitest/autorun" is a library gives us access to certain parts of the minitest framework that we need.
# We also require the class we want to test and any classes it depends on. Because we put `CashRegister` and `Transaction` in their own separate files, two relative requires are necessary to gain access to both classes.
# To set up the correct testing class, by minitest convention, we name the class by the class name followed by "Test". We also make sure that our test class subclasses from `Minitest::Test`. If we didn't include this inheritance, then this would be a plain Ruby class and not a test class.

# We use a setup method to create instance variables for a register and transaction.

# `accept_money` is a method from class `CashRegister`, so we need an instance of that class. We also need an instance of class `Transaction` because the `accept_money` method takes a `Transaction` object as an argument.
# We set the `amount_paid` via the `attr_accessor` in the `Transaction` class. This is the value we'll be checking. If the method works as intended, when we process a transaction, the amount in `register` should increase by the amount paid.
# Lastly, we implement the assertion with `assert_equal`.

# `test_change`: We set the amount paid. Here, we overpay and should be getting money back.

# `test_give_receipt`: `assert_output` takes an argument in which we place the expected value and a block in which we place the code that will produce the "actual" output. We include a newline character in our expected argument because `puts` appends a newline to the message that's output.

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  attr_reader :register, :groceries

  def setup
    @register = CashRegister.new(200)
    @groceries = Transaction.new(80)
  end

  def test_accept_money
    groceries.amount_paid = 100
    register.accept_money(groceries)

    assert_equal(300, register.total_money)
  end

  def test_change
    groceries.amount_paid = 90

    assert_equal(10, register.change(groceries))
  end

  def test_give_receipt
    assert_output("You've paid $#{groceries.item_cost}.\n") {register.give_receipt(groceries)}
  end
end