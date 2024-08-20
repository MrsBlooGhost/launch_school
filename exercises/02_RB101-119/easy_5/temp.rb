=begin
P-----
Write two methods that take a time of day in 24-hour format, and return the number
of minutes before and after midnight, respectively.

rules:
- If the number of minutes is positive, the time is after midnight.
- If the number of minutes is negative, the time is before midnight.
- You may not use the `Date` and `Time` classes.
- Both methods should return a value in the range `0..1439`.
- Disregard Daylight Savings and Standard Time and other irregularities.

input: a string in hh:mm format
return: an integer

E-----
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

D-----

A-----
- Define a few constants:
  - `MINUTES_PER_HOUR = 60`
  - `HOURS_PER_DAY = 24`
  - `MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY`
- Define a method `after_midnight` that takes one parameter.
  - Split the string on the ":" into an array.
  - Initialize `minutes_after` to return value of multiplying element at
  index 0 by `MINUTES_PER_HOUR` and all element at index 1.
  - Return the value of `minutes_after % 1440`.
- Define a method `before_midnight` that takes one parameter.
  - `MINUTES_PER_DAY` minus the method call `after_midnight`.

C-----
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0