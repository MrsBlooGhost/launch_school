=begin
P-----
Write a method that takes a positive integer as an argument, and returns the
sum of its digits.

Rules:

Input: a positive integer
Return: an integer representing the sum of input's digits

E-----
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

A-----
- Define a method `sum` with one parameter `num`.
- Convert `num` to an array of digits.
  - Convert `num` to a string, then convert the string to an array of characters.
- Initialize local variable `sum_total` to 0.
- Obtain size of the array, and perform iteration this many times.
  - Re-assign `sum_total` to the sum of `sum_total` and current digit.
- Return `sum_total`.

C-----
=end

def sum(num)
  sum = 0
  string_nums = num.to_s.chars
  string_nums.each do |string_digit|
    sum += string_digit.to_i
  end
  sum
end

p sum(23) #== 5
p sum(496) #== 19
p sum(123_456_789) #== 45