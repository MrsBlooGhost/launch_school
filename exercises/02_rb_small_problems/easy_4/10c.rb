# P---------------
# Extend the method from the previous exercise so that it converts non-negative
# numbers to string.

# Input: an integer
# Output: a string

# Explicit:
# - You may not use `Integer#to_s`, `String()`, or `Kernel#format`.
# - You may use `integer_to_string` from the previous exercise.

# E---------------
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# D---------------

# A---------------
# 1. Define a method `signed_integer_to_string` that takes one parameter.
#   - If the input integer starts with a `-`, invoke `integer_to_string`, passing
# in the absolute value of the integer. Prepend a `-` to the returned string.
#   - If the input integer is greater than 0, invoke `integer_to_string` and
# prepend a `+` to the returned string.

# C---------------
STR_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  string_integer = ''
  loop do
    integer, remainder = integer.divmod(10)
    string_integer.prepend(STR_DIGITS[remainder])
    break if integer == 0
  end
  string_integer
end

# def signed_integer_to_string(integer)
#   if integer.abs != integer
#     integer_to_string(integer.abs).prepend('-')
#   elsif integer > 0
#     integer_to_string(integer).prepend('+')
#   else
#     integer_to_string(integer)
#   end
# end

def signed_integer_to_string(integer)
  case integer <=> 0
  when -1 then integer_to_string(integer.abs).prepend('-')
  when +1 then integer_to_string(integer).prepend('+')
  else         integer_to_string(integer)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'