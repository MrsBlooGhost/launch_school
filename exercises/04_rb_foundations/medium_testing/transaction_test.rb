require 'minitest/autorun'
require_relative 'transaction'

class TestExercise6 < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new("35\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal(35, transaction.amount_paid)
  end
end
