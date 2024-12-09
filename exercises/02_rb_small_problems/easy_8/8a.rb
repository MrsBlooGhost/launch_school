=begin
P-----
Write a method that takes a string argument and returns a new string with the
words in reverse order.

Rules:
- If input string consists of whitespace, return an empty string.

Input: a string
Return: a new string

E-----
puts reverse_sentence('Hello World') == 'World Hello'
  - 1x
puts reverse_sentence('Reverse these words') == 'words these Reverse'
  - 1x
puts reverse_sentence('Reverse these small words') == 'words these small Reverse'
  - 2x
puts reverse_sentence('Reverse these very small words') == 'words these very small Reverse'
  - 2x
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

A-----
- Define a method `reverse_sentence` with one parameter `string`.
- Convert `string` to an array of words.
- Initialize local variable `left_index` to 0.
- Initialize local variable `right_index` to -1.
- If `array.size` is even, repeat the following steps `array.size - 1` times.
If `array.size` is odd, repeat the following steps `array.size / 2` times.
  - Use parallel assignment to reverse the words at `left_index` and `right_index`.
  - Increment `left_index` by 1. Decrement `right_index` by 1.
- Join `array_of_words` to return a string.

C-----
=end

def reverse_sentence(string)
  left_index = 0
  right_index = -1
  array_of_words = string.split
  if array_of_words.size % 2 == 0
    (array_of_words.size-1).times do
      array_of_words[left_index], array_of_words[right_index] = array_of_words[right_index], array_of_words[left_index]
      left_index += 1
      right_index -= 1
    end
  else
    (array_of_words.size / 2).times do
      array_of_words[left_index], array_of_words[right_index] = array_of_words[right_index], array_of_words[left_index]
      left_index += 1
      right_index -= 1
    end
  end
  array_of_words.join(' ')
end

p reverse_sentence('Hello World') == 'World Hello'
p reverse_sentence('Reverse these words') == 'words these Reverse'
p reverse_sentence('') == ''
p reverse_sentence('    ') == '' # Any number of spaces results in ''