require 'minitest/autorun'

class TestExercise10 < Minitest::Test
  def test_1
    list = ['123', 'xyz']
    refute_includes(list, 'xyz')
  end
end

# `refute_includes(collection, obj, msg = nil)`
# Most minitest assertions have a corresponding refutation method that fails if the indicated condition is true. 