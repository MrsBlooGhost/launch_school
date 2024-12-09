=begin
P-----
Write a method that takes a string argument and returns a new string in which
every uppercase letter is replaced by its lowercase version and vice versa.

Rules:
- All other characters should be unchanged.
- You may not use the `String#swapcase` method.

Input: a string
Return: a new string

E-----
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

A-----
- Define some constants:
  - `UPPERCASE_LETTERS = ('A'..'Z').to_a`
  - `LOWERCASE_LETTERS = `('a'..'z').to_a`
- Define a method `swapcase` with one parameter.
- Convert the input string to an array.
- Iterate through the array, performing transformation.
  - If `UPPERCASE_LETTERS` includes current character, return its downcased version.
  - If `LOWERCASE_LETTERS` include current character, return its upcased version.
  - If neither, return current character.
- Join together the elements of the array.

C-----
=end
UPPERCASE_LETTERS = ('A'..'Z').to_a
LOWERCASE_LETTERS = ('a'..'z').to_a

def swapcase(string)
  string.chars.map do |char|
    if UPPERCASE_LETTERS.include?(char)
      char.downcase
    elsif LOWERCASE_LETTERS.include?(char)
      char.upcase
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'