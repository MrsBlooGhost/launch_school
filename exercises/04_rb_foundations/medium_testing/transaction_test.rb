# `test_prompt_for_payment`:
# We first create a new transaction for a coffee that costs $5.
# We then create a `StringIO` object that simulates a keyboard entry of the number `5` followed by a newline character. 
# Next, we pass the `StringIO` object to the `prompt_for_payment` method. Since `prompt_for_payment` will get its input from the `StringIO` object, it will act exactly like it would have were we using the keyboard directly. In this case, it will set the amount paid to $5 and return. 
# We assert that the right amount was paid. 

# This exercise involves two things:
# 1) We create a mock object to use in `test_prompt_for_payment` with `output = StringIO.new`. Unlike when we created a mock object for `input`, we don't have to set the string for our mock. We'll end up calling `StringIO#puts` on `output`, and that's what will set the string value for our `StringIO` mock object.
# 2) We have to alter the `Transaction#prompt_for_payment` method to accept a mock of our output. This will work in a similar way to how we mocked the input. We add a new parameter to `Transaction#prompt_for_payment` that will allow us to pass in an output mock object `def prompt_for_payment(input: $stdin, output: $stdout)`. We then use this `output` mock object within our method by calling `StringIO#puts`. This way, the string passed to `puts` gets stored within the `StringIO` object and isn't output to the user. 

require 'minitest/autorun'
require_relative 'transaction'

class TestExercise6 < Minitest::Test
  # Exercise 6 version of `test_prompt_for_payment`
  # def test_prompt_for_payment # pass
  #   coffee = Transaction.new(5)
  #   input = StringIO.new("5\n")
  #   coffee.prompt_for_payment(input: input)

  #   assert_equal(5, coffee.amount_paid)
  # end

  # Exercise 7 version of `test_prompt_for_payment`
  def test_prompt_for_payment # pass
    coffee = Transaction.new(5)
    input = StringIO.new("5\n")
    output = StringIO.new
    coffee.prompt_for_payment(input: input, output: output)

    assert_equal(5, coffee.amount_paid)
  end
end
