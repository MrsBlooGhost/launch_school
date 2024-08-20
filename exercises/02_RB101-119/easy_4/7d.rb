# P------

# Write a method that takes a string of digits and returns an integer representation
# of it.

# explicit:
# - disregard leading + and - signs
# - assume all characters will be numeric
# - you may not use the standard conversion methods such as `String#to_i` or `Integer()`

# implicit:

# input: a stirng
# return: an integer

# E------
# string_to_integer('4321') == 4321


# string_to_integer('570') == 570

# D------

# A------
# 1- Create a reference hash from 0 to 9.
# 2- Obtain the size of the input string.
# 3- Iterate from 0 up to integer obtain in Step 2, obtaining the associated value
# and multiplying it by 10**(current iteration number).
# 4- Return the final value.

# C------
REFERENCE = {'0'=>0, '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=> 8, '9'=>9}

def string_to_integer(string)
  num = 0
  0.upto(string.size-1) do |x|
    num = 10 * num + REFERENCE[string[x]]
  end
  num
end

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570