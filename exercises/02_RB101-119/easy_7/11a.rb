=begin
P-----
Write a method that counts the number of occurrences of each element in a given
array.

Rules:
- The words in the array are case sensitive.
- Output each element alongside the number of occurrences.

Input: an array
Output: each key-value pair

E-----
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)

car => 4
truck => 3
SUV => 1
motorcycle => 2

A-----
- Deifne a method `count_occurrences` with one parameter.
- Initialize a hash `result` to an empty hash.
- Iterate through the input array:
  - Count the amount of occurrences of current element in the array and assign
  the result value to local variable `occurrence`.
  - Using hash element assignment, assign the current element as a key in `result`
  and `occurrence` as a value.
- Output each pair of `result`.

C-----
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(vehicles)
  result = {}
  vehicles.each do |vehicle|
    occurrence = vehicles.count(vehicle)
    result[vehicle] = occurrence
  end
  result.each { |key, value| puts "#{key} => #{value}" }
end

count_occurrences(vehicles)