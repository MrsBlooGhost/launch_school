require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

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

  def test_change
    transaction = Transaction.new(10)
    transaction.amount_paid = 13

    assert_equal(3, @register.change(transaction))
  end
  
  def test_give_receipt
    transaction = Transaction.new(14)
  
    assert_output("You've paid $14.\n") {@register.give_receipt(transaction)}
  end
end
