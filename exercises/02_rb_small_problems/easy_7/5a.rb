=begin
P-----
Write a method that takes a string argument and returns a new string that
contains the original value using a staggered capitalization scheme in which
every other character is capitalized and the remaining characters are lowercase.

Rules:
- Characters that aren't letters shouldn't be changed. However, they do count as
characters when switching between upper and lowercase.
- Spaces count as characters.
- The returned string starts with an upcased character.

Input: a string
Return: a new string

E-----
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

A-----
- Define a method `staggered_case` with one parameter.
- Convert input string to array.
- Initialize local variable `index` to 0.
- Loop:
  - If `index` is even, return upcased version of character.
  - If `index` is odd, return downcased version of character.
- Join the array together and return it.

C-----
=end
def staggered_case(string)
  index = -1
  staggered_letters = string.chars.map do |char|
    index += 1
    index % 2 == 0 ? char.upcase : char.downcase
  end
  staggered_letters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'