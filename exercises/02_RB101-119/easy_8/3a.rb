=begin
P-----
Write a method that returns a list of all substrings of a string.

Rules:
- The returned list is ordered where in the string the substring begins, meaning
substrings starting at index 0 come first, then substrings starting at index 1, etc.
- Substrings should be returned in order from shortest to longest.
- Use the `leading_substrings` method you wrote in the previous exercise.

Input: a string
Return: an array of strings

E-----
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e']

A-----
- Define a method `substrings` with one parameter `string`.
- Initialize local variable `result` to an empty array.
- Invoke the `leading_substrings(string)` method and pass `current_string` as an
argument.
  - Append the return value to `result`.
- Re-assign `current_string` to `string[1..-1]`. Repeat above steps.
- Re-assign `current_string to `string[2..-1]`. Repeat above steps. Etc.
- Flatten `result` and return it.

C-----
=end

def substrings(string)
  result = []

  0.upto(string.size - 1) do |index|
    result << leading_substrings(string[index..-1])
  end

  result.flatten
end

def leading_substrings(string)
  result = []

  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end

  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e']