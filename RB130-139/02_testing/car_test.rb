require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'car'

Minitest::Reporters.use!

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
