require 'minitest/autorun'

class TestExercise8 < Minitest::Test
  def test_value_float # pass
    value = 3.5
    assert_kind_of(Numeric, value)
  end

  def test_value_integer # pass
    value = 3
    assert_kind_of(Numeric, value)
  end

  def test_value_string # fail
    value = '3'
    assert_kind_of(Numeric, value)
  end
end

# `#assert_kind_of(cls, obj, msg = nil)` uses `Object#kind_of?` to check if the class of its second argument is an instance of the named class or one of the named class's subclasses. 
  # Fails unless `obj` is a kind of `cls`