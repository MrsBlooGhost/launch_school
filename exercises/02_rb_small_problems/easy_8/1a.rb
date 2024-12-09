=begin
P-----
Write a method that takes an array of numbers and returns the sum of the sums
of each leading subsequence for the array.

Rules:
- Assume the array contains at least one number.

Input: an array
Return: an integer

E-----
sum_of_sums([3, 5, 2]) == 21
  (3) + (3 + 5) + (3 + 5 + 2)

sum_of_sums([1, 5, 7, 3]) == 36
  (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)

sum_of_sums([4]) == 4

sum_of_sums([1, 2, 3, 4, 5]) == 35
  (1) + (1 + 2) + (1 + 2 + 3) + (1 + 2 + 3 + 4) + (1 + 2 + 3 + 4 + 5)

A-----
MAIN METHOD:
- Define a method `sum_of_sums` with one parameter.
- Initialize local variable `sum` to 0.
- Iterate through the input array.
  - Re-assign `sum` to the addition of `sum` and the current element
  plus all elements before it.
- Return `sum`.

C-----
=end

def sum_of_sums(array)
  sum = 0
  array.each_with_index do |element, index|
    sum += array[0, index+1].inject(:+)
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35