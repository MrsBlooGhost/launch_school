=begin
# ----- P
Background: The `Enumerable#drop_while` method begins by iterating over the members of the collection, passing each element to the associated block until it finds an element for which the block returns `false` or `nil`. It then converts the remaining elements of the collection (including the element that resulted in a falsy return) to an array, and returns the result.

Task: Write a method `drop_while` that behaves similarly for arrays. 

Rules
- Input: an array and a block
- Return: an array containing all elements of input array, except those elements at the beginning of the array that produce a truthy value when passed to the block
- Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#reduce`, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# ----- E
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []

# ----- A1
- Iterate over input array, accessing each element and its index.
  - Yield to the block, passing in current element.
    - If return value of block is falsy, explicitly return an array of element/s from current index up to last index.
- Return empty array.

=end
# ----- C1
def drop_while(arr)
  arr.each_with_index do |element, idx|
    return arr[idx..-1] unless yield(element)
  end
  []
end

# ----- C2
def drop_while(arr)
  index = arr.find_index { |element| !yield(element)}
  index ? arr[index..-1] : []
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } #== [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []