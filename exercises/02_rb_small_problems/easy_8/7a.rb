=begin
P-----
Write a method taht takes a string, and returns a new string in which every
consonant character is doubled.

Rules:
- Vowels (a, e, i, o, u), digits, punctuation, and whitespace aren't doubled.
- Case is preserved.

Input: a string
Return: a new string

E-----
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

A-----
- Initialize a constant `ALPHABET` to upper- and lowercase alphabetical letters.
- Initialize a constant `CONSONANTS` to `/[^aeiou]/i`
- Define a method `double_consonants` with one parameter `string`.
- Initialize local variable `result` to an empty string.
- Iterate through input string `string`:
  - If the current character is included in `ALPHABET` and is included in `CONSONANTS`,
  concatenate it on to `result` twice.
  - Otherwise, concatenate the current character on to `result` once.
- Return `result`.

C-----
=end

ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
CONSONANTS = /[^aeiou]/i

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char if ALPHABET.include?(char) && (CONSONANTS =~ char)
    result << char
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""