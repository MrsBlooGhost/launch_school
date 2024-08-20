=begin
P-----
Write a method that takes a grocery list (array) of fruits with quantities, and
converts it into an array of the correct number of each fruit.

Rules:
- The returned array should contain the number of fruits listed in the particular
subarray.

Input: a nested array
Return: the same array, modified

E-----
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

A-----
- Define a method `buy_fruit` with one parameter `grocery_list`.
- Iterate through `grocery_list`, performing transformation:
  - For each subarray, multiply the string by the integer.
- Flatten the nested array, and return the result.

C-----
=end

def buy_fruit(grocery_list)
  expanded_list = []

  grocery_list.each do |subarray|
    fruit, quantity = subarray[0], subarray[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  # ["apples", "apples", "apples", "orange", "bananas","bananas"]