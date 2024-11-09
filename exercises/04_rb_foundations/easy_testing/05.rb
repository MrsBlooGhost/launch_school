# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'

class TestExercise5 < Minitest::Test
  def test_list_including_xyz # pass
    value = 'xyz'
    list = ['123', 'xyz']
    assert_includes(list, value, 'xyz not found in list')
  end

  def test_list_excluding_xyz # fail
    value = 'xyz'
    list = ['123', 'abc']
    assert_includes(list, value, 'xyz not found in list')
  end
end

# `assert_includes(collection, obj, msg = nil)` tests whether its first argument contains the second argument.
  # Fails unless `collection` includes `obj`.
  # `#assert_includes` 
# You can use `#assert_equal(true, list.include?('xyz')), but the above solution is clearer and issues a better failure message.