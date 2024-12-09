=begin
P-----
Write a method that prints out groups of words that are anagrams.

Rules:
- Anagrams are words that have the same exact letters in them but in a different
order.
- The anagrams are all within the given array.
- Each returned array consists of anagrams of each other.

Input: an array
Output: multiple arrays printed on separate lines

E-----
Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

A-----
- Define a method `anagrams` with one parameter `words`.
-

C-----
=end
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |value|
  puts "-----"
  p value
end