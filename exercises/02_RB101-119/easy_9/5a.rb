=begin
P-----
Write a method that takes a first name, a space, and a last name passed as a string
argument, and returns a string containing the last name, a comma, a space, and
the first name.

Rules:
- Case is preserved.

Input: a string
Return: a new string

E-----
swap_name('Joe Roberts') == 'Roberts, Joe'

A-----
- Define a method `swap_name` with one parameter `first_last`.
- Convert `first_last` to an array of words.
- Reverse the order of the words in the array.
- Join the array together, separate by a comma then a space.
  - Return the resulting string.

C-----
=end
def swap_name(first_last)
  first_last.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'