=begin
P-----
Write a method that takes an array of integers as input, multiplies all the
numbers together, divides the result by the number of elements in the array, and
prints the result rounded to 3 decimal places.

Rules:
- Assume the array isn't empty.

Input: An array
Output: A string

E-----
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

A-----
- Define a method `show_multiplicative_average` with one parameter.
- Multiply all the elements of the array together and assign the return value to
a local variable `product`.
- Divide `product` by the size of the input array (float) and assign return value
to a local variable `quotient`.
- Output `"The result is"` and use string interpolation to output `quotient` to
3 decimal places.

C-----
=end

def show_multiplicative_average(array)
  product = array.inject(:*)
  quotient = product / array.size.to_f
  puts "The result is #{format("%.03f", quotient)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667