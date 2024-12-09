=begin
P-----
Write a method that takes two integers as arguments. The first argument is a count
and the second argument is the first number of a sequence that the method creates.
The method returns an array containing the same number of elements as the count
argument, while the values of each elements are multiples of the starting number.

Rules:
- Assume the count argument has a value of 0 or greater.
  - If the count is 0, an empty list is returned.
- Assume the starting number is any integer.
- The values of the returned array are multiples of the starting number.

Input: two integers - first is a count, second is the starting number of the
returned array
Return: an array - contains same number of elements as the count specifies,
values are multiples of the starting number

E-----
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

A-----
- Define a method `sequence` with two parameters `count` and `num`.
- Initialize local variable `result` to an empty array.
- Perform the following steps `count` number of times:
  - Append `num * count` to `result`.
- Return `result`.

C-----
=end

def sequence(count, num)
  (1..count).map { |value| value * num }
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) #== [0, 0, 0]
p sequence(0, 1000000) #== []