=begin
--- PD
Task: Create a clock that is independent of date.
Input: time (Integer)
Return: time (String)
Intermediate: array of integers?

Rules:
- You may not use any built-in date or time functionality; just use arithmetic operations.
- Be able to add minutes to and subtract minutes from the time represented by a given `Clock` object. Don't mutate `Clock` objects when adding and subtracting minutes -- create a new `Clock` object.
- Two clock objects that represent the same time should be equal to each other.
--- E

--- A-Broad
Class `Clock`

Class method `at`
- accepts 1-2 integer/s as argument representing the hour and the minute

method `to_s`
- returns string representation in hh:mm format

method `+`
- accepts an integer representing minutes as argument
- adds the given integer minutes to the clock's time
- return new `Clock` object

method `-`
- accepts an integer representing minutes as argument
- subtracts the given integer minutes to the clock's time
- return new `Clock` object

method `==`
- Two clock objects that represent the same time should be equal to each other.

--- A-Detailed
Class `Clock`

constant `MINUTES_PER_DAY` initialized to (24 * 60)

Class method `at`
- accepts two integers as arguments, save in local variables `hour` and `minutes`. if second argument isn't given, use default of 0.
- multiply `hour` by 60, add `minutes`, save in local variable `total_minutes`.
- initialize a new `Clock` object, passing in `total_minutes`. return object.

constructor
- accepts an argument, save in instance variable `@total_minutes`
  - if `total_minutes` is equal to 0, re-assign it to 1440.
  - if `total_minutes` is greater than 1440, re-assign it to `total_minutes` - 1440 until it is less than 1440.
  - if `total_minutes` is less than 0, re-assign it to `total_minutes` + 1440 until it is greater than 0.

method `to_s`
- perform (divmod 60) on `@total_minutes`, which is equal to [hh:mm]
- returns string representation in hh:mm format
  sprintf('%02d:%02d', hour, minute)

method `+`
- accepts an integer representing minutes as argument
- add given integer to `@total_minutes`, save in `new_minutes`
- instantiate new `Clock` object, passing in `new_minutes`

method `-`
- accepts an integer representing minutes as argument
- add given integer to `@total_minutes`, save in `new_minutes`
- instantiate new `Clock` object, passing in `new_minutes`

method `==`
- returns true if `@minutes` of two clock objects are equal
=end

class Clock
  attr_reader :total_minutes

  def self.at(hour, minutes=0)
    total_minutes = (hour * 60) + minutes
    new(total_minutes)
  end

  def initialize(minutes)
    if minutes.zero?
      @total_minutes = 1440
    elsif minutes > 1440
      minutes -= 1440 until minutes < 1440
    elsif minutes < 0
      minutes += 1440 until minutes > 0
    end
    @total_minutes = minutes
  end

  def to_s
    hour, minute = @total_minutes.divmod(60)
    format('%02d:%02d', hour, minute)
  end

  def +(minutes)
    new_minutes = @total_minutes + minutes
    self.class.new(new_minutes)
  end

  def -(minutes)
    new_minutes = @total_minutes - minutes
    self.class.new(new_minutes)
  end

  def ==(other)
    @total_minutes == other.total_minutes
  end
end
