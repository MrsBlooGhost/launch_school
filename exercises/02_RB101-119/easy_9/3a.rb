=begin
P-----
Write a method that takes an integer argument, and returns an array of all
integers in sequence between 1 and the argument.

Rules:
- Inclusive
- Assume the argument is a valid integer greater than 0.

Input: an integer
Return: an array of integers

E-----
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

A-----
- Define a method `sequence` with one parameter `num`.
- Return an array of integers from 1 to `num`.

C-----
=end

def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]