=begin
# ----- P
Background: The `Enumerable#each_with_index` method iterates over the members of a collection, passing each element and its index to the associated block. The value returned by the block isn't used. `each_with_index` returns a reference to the original collection.

Task: Write a method `each_with_index` that behaves similarly for arrays.

Rules
- Input: an array and a block
- Return: a reference to original input array
- `each_with_index` should yield each element and an index number to the block
- Your method may use `#each`, `#each_with_object`, `#reduce`, `loop`, `for`, `while`, or `until` to iterate through input array, but must not use any other methods that iterate through an Array or any other collection

# ----- E
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# output:
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# ----- A1
- Initialize `idx` to 0.
- Iterate over input array, accessing each element.
  - Yield to the block, passing in current element and `idx`.
  - Increment `idx` by 1.
- Ensure return value is a reference to the original array

=end
# ----- C1
def each_with_index(arr)
  idx = 0
  arr.each do |element| 
    yield(element, idx) 
    idx += 1
  end
end

# ----- C2
def each_with_index(arr)
  arr.each_with_object([]) { |element, arr| arr << element }
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# output:
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

p result