=begin
# ----- P
Background: The `Enumerable#each_with_object` method iterates over the members of a collection, passing each element and an arbitrary object (usually a collection) to the associated block. The value returned by the block isn't used; with each iteration, this object may be updated by the block. When iteration is complete, the final value of the object is returned.

Task: Write a method called `each_with_object` that behaves similarly for arrays. 

Input
- an array and an object, and a block
Return
- final value of the object
- if input array is empty, return original object passed as second argument
Rules
- Yield each element and the object to the block
- Value returned by the block isn't used
- With each iteration, object may be updated by the block
- May use #each, #each_with_index, #reduce, loop, for, while, or until to iterate through input array, but must not use any other methods that iterate through an array or any other collection

# ----- E

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
result == [1, 9, 25]
1**2 --> 1 --> [1]
3**2 --> 9 --> [1, 9]
5**2 --> 5 --> [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
(1..1).to_a --> [1] --> [[1]]
(1..3).to_a --> [1, 2, 3] --> [[1], [1, 2, 3]]
(1..5).to_a --> [1, 2, 3, 4, 5] --> [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
result == { 1 => 1, 3 => 9, 5 => 25 }


result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
result == {}

# ----- D

Input: an array and an object, and a block
Output: final value of the object

# ----- A1
- iterate over original array
- yield to the block, passing in current element and object
- return object

=end
# ----- C1
# ----- Solution 1
# We yield the element value and the object to our block for each element of the array. We then return that object at the end.

def each_with_object(arr, obj)
  arr.each { |el| yield(el, obj) }
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]


result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}