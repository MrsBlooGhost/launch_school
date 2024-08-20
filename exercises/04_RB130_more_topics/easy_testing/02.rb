require 'minitest/autorun'

class TestExercise2 < Minitest::Test
  def test_different_cased_letters
    value = 'Xyz'
    assert_equal('xyz', value.downcase)
  end

  def test_different_letters
    value = 'Abc'
    assert_equal('xyz', value.downcase)
  end
end

# `assert_equal(exp, act, msg = nil)` tests whether its first two arguments are equal using `#==`. The first argument represents the expected value and the second argument represents the actual value to be tested. 