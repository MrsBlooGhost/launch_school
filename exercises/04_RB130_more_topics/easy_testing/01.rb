require 'minitest/autorun'

class TestExercise1 < Minitest::Test
  def test_odd_value
    value = 3
    assert(value.odd?, 'Value is not odd')
  end

  def test_even_value
    value = 4
    assert(value.odd?, 'Value is not odd')
  end
end

# All assertion methods accept a `msg` which is printed if the assertion fails. Most, but not all, of the Minitest assertions let you specify the failure message as the final argument. This is frequently omitted since the error messages provided by default are usually sufficient. 

# `#assert(test, msg = nil)` tests whether its first argument is truthy. If it isn't, the test fails, and the second argument is displayed as the failure message. The default message for `#assert` lacks context, so it's common to specify the failure message when using `#assert`.
# `#assert` isn't used directly in most tests since it's usually more important to ensure an exact value is returned. If you want to know that your method returns `true` and not just a truthy value, `assert_equal` is a better choice.

# ----- Solution
assert(value.odd?, 'value is not odd')

# ----- Implemented Solution
# There are minimum requirements to put a successful test together. Assuming the Minitest gem is installed:
  # 1. Require 'minitest/autorun'.
  # 2. Define a subclass of `Minitest::Test`.
  # 3. In that subclass, have at least one method whose name begins with `test_`. If the method name doesn't begin with `test_`, that method will be ignored. 