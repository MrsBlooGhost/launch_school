=begin
P-----
Write a method that takes a string argument, counts the lowercase letters, then
returns the letter count in a hash with the letter as key and the count as value.

Rules:
- The key must be a symbol rather than a string.

Input: a string
Return: a hash

E-----
letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

A-----
- Initialize `result` to an empty hash.
- Convert input string to an array of characters.
- Iterate over the array:
  - Count the amount of occurrences current element is in the array.
  - Assign the current letter as a symbol in the hash and its count as the value.
- Return `result`.

C-----
=end

def letter_count(string)

end

p letter_count('arithmetics') #== {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') #== {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})