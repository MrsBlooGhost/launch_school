# It is bad practice to subclass from `Exception` for custom errors. We should instead subclass from `StandardError`.

require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError, 'Employee has no experience'
  end
end

class TestExercise6 < Minitest::Test
  def test_hire_employee
    employee = Employee.new
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end