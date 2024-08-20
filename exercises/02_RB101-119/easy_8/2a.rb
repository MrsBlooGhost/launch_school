=begin
P-----
Write a method that returns a list of substrings of a string that start at the
beginning of the original string.

Rules:
- The return value is arranged in order from shortest to longest substring.

Input: a string
Return: an array of strings

E-----
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

A-----
- Define a method `leading_substrings` with one parameter `string`.
- Initialize local variable `result` to an empty array.
- Perform the following iteration `string.size - 1` times:
  - Access `array` starting at index 0 and ending at the current element.
  - Append this string to `result`.
- Return `result`.

C-----
=end

def leading_substrings(string)
  result = []

  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end

  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']