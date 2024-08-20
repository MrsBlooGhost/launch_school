require 'minitest/autorun'

class TestExercise3 < Minitest::Test
  def test_nil # pass
    value = nil
    assert_nil(value, 'Value is not nil')
  end

  def test_truthy_value # fail
    value = 3
    assert_nil(value, 'Value is not nil')
  end
end

# `assert_nil(obj, msg = nil)` 
  # Fails unless `obj` is nil.