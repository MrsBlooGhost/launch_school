=begin
# ----- E
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil

# ----- P
Rules
- input
  - an array and a block
  - array length is even
- yield each consecutive pair of elements to the block
  - "consecutive pair" means elements at index 0 and 1, then elements at index 1 and 2, at 2 and 3, etc.
- return
  - nil
- Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until to iterate through the array passed in as an argument, but not any other methods that iterate through an Array or any other collection

# ----- D
input: array
return: nil

# ----- A1
- iterate over array, passing pairs of elements to the block for processing.
  - iterate over array, accessing each element and its index
    - yield elements at current index and (index + 1) to the block
- return nil.

=end
# ----- C1
def each_cons(arr)
  arr.each_with_index do |el, idx|
    yield(el, arr[idx + 1]) unless idx + 1 >= arr.size
  end
  nil
end

# ----- C2
# The hardest part of the exercise is deciding when to stop iterating. We stop when the current element is the last element, which we can detect by comparing the value of `index + 1` against the array size.

def each_cons(arr)
  arr.each_with_index do |item, index|
    break if index + 1 >= arr.size
    yield(item, arr[index + 1])
  end
  nil
end

# ----- C3
def each_cons(arr)
  arr.inject do |memo, el|
    yield(memo, el)
  end
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
result == nil
