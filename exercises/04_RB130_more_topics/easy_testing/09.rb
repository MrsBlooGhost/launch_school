require 'minitest/autorun'

class TestExercise9 < Minitest::Test
  class List
    def process
      'process'
    end
  end

  def test_same_obj # fail
    list = List.new
    list = 'run through list'
    assert_same(list, list.process)
  end
end

# `#assert_same(exp, act, msg = nil)` tests whether its first and second arguments are the same object, as determined by `#equal?`.
  # Fails unless `exp` and `act` are equal?
