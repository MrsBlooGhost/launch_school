require 'minitest/autorun'

class TestExercise4 < Minitest::Test
  def test_empty_list # pass
    array = []
    assert_empty(array, 'Array is not empty')
  end

  def test_list_of_integers # fail
    array = [1, 2]
    assert_empty(array, 'Array is not empty')
  end
end

# `#assert_empty(obj, msg = nil)` tests whether its first argument responds to the method `#empty?` with a `true` value.
  # Fails unless `obj` is empty
# You can use `assert_equal(true, list.empty?)`, but the above solution is clearer and issues a better failure message.