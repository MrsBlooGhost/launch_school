=begin
# ----- E
max_by([1, 5, 3]) { |value| value + 2 } == 5
1 -- 3
5 -- 7 => 5
3 -- 5

max_by([1, 5, 3]) { |value| 9 - value } == 1
1 -- 8 => 1
5 -- 4
3 -- 6

max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil

# ----- P
Rules
input
- an array and a block
- iterate over elements of an array, passing each element to the associated block
return
- the element for which the block returns the largest value
- nil, if original array is empty
your method may use #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until to iterate through the Array passed in as an argument, but not any other methods that iterate through an Array or any other collection.

# ----- D
input: array
return: an integer representing element that contains the largest value

hash, because each element is to be associated with a block return value

# ----- A1
Return `nil` if original array is empty.

Assign current element of array as hash key and its associated block return value as hash value.
- iterate over original array, accessing each element. 
- yield to the block, passing in the current element.
- use hash element assignment to assign current element as key and block's return value as value.

Return key associated with largest value in hash.
- iterate over hash, sorting it by value. 
- get last element in the returned nested array. get first element in that last element array.

=end
# ----- C1
def max_by(arr)
  return nil if arr.empty?
  hsh = {}
  arr.each { |el| hsh[el] = yield(el) }
  hsh.sort_by { |k, v| v }.last.first
end

# ----- C2
# This solution takes advantage of the fact that `Hash#key` returns nil if no key is found. This handles the edge cases of an empty original array. 

def max_by(arr)
  list = {}
  arr.each { |item| list[item] = yield(item) }
  list.key(list.values.max)
end

# ----- C3
# We first handle the edge case of an empty array. We return nil for an empty array.
# We iterate through the array elements, finding the largest block return value and its associated element with the following two steps...
# We need to select a reasonable initial value to be compared against each block return value. We choose to pass the first item in the array to the block, then use the return value as the initial largest value. 
# We track the element that returned the largest value to date in `max_element`, which we initialized to the first element of the array. 

def max_by(arr)
  return nil if arr.empty?

  max_element = arr.first
  largest = yield(max_element)

  arr[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil