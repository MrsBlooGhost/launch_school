=begin
P-----
Write a method that returns a list of all substrings that are palindromic.

Rules:
- A palindromic substring consists of the same sequence of characters forwards
as it does backwards.
- The return value is arranged in the same sequence as the substrings appear in
the string.
- Duplicate palindromes are included multiple times.
- Use the `substrings` method you wrote in the previous exercise.
- Consider all characters and pay attention to case.
- Assume that single characters aren't palindromes.

Input: a string
Return: an array

E-----
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo']
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']

A-----
- Define a method `palindromes` with one parameter `string`.
- Initialize local variable `result` to an empty array.
- Iterate through the return value of invoking the `substrings(string)` method
and passing `string` as an argument:
  - If the current element is a palindrome, append it to `result`.
- Return `result`.

C-----
=end

def palindromes(string)
  result = []
  all_substrings = substrings(string)
  all_substrings.each do |substring|
    result << substring if palindrome?(substring)
  end
  result
end

def palindrome?(string)
   string == string.reverse && string.size > 1
end

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

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo']
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']