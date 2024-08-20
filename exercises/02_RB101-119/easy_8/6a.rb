=begin
P-----
Write a method that takes a string as an argument and returns a new string in
which every character is doubled.

Rules:
- Case is preserved.

Input: a string
Return: a new string

E-----
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

A-----
- Define a method `repeater` with one parameter `string`.
- Initialize local variable `result` to an empty string.
- Iterate through input string:
  - Append the current character twice to `result`.
- Return `result`.

C-----
=end

def repeater(string)
  result = ''
  string.each_char do |char|
    2.times { result << char }
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''