=begin
P-----
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should upcase or downcase each letter.

Rules:
- The non-alphabetic characters should still be included in the return value,
but they don't count when toggling the desired case.

Input: a string
Return: a new string

E-----
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

A-----
- Define a method `staggered_case` with one parameter.
- Initialize local variable `result` to an empty string.
- Initialize `alphabetic_chars` to string with only alphabetic characters.
- Initialize local variable `need_upper` to `true`.
- Convert input string to an array of characters and iterate through the array.
  - If `need_upper` is equal to `true`, return upcased version of string.
  - Otherwise return downcased version of string.
- Return `result.
C-----
=end

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
  end
  result
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'