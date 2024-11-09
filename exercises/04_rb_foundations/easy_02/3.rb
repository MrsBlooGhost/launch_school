=begin
# ----- P
Background: The `Enumerable#map` method iterates over the members of a collection, using the associated block to perform some sort of operation on each collection member. The returned values from the block are then built up into an array that's returned to the caller. Every time `#map` yields to the block, it obtains just one value. Thus, `#map` returns an array that has the same number of elements that the original collection had. 

Task: Write a method `map` that behaves similarly for arrays. 

Rules
- Input: an array and a block
- Return: a new array that contains the return values produced by the block for each element of input array
- You may use `#each`, `#each_with_object`, `#each_with_index`, `#reduce`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument

# ----- E
map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
map([]) { |value| true } == []
map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# ----- A1
- Initialize `result` to empty array.
- Iterate over input array, accessing each element.
  - Yield to the block, passing each element as an argument.
  - Append the return value of the block to `result`.
- Return `result`.

=end
# ----- C1 Using `#each`
# We iterate through the input array, and append the return value of `yield(element)` to our result array.

def map(arr)
  result = []
  arr.each { |element| result << yield(element) }
  result
end

# ----- C2 Using `#each_with_object`
def map(arr)
  arr.each_with_object([]) { |element, result| result << yield(element) }
end

# ----- C3 Using `while` loop
def map(arr)
  result = []
  counter = 0

  while counter < arr.size
    result << yield(arr[counter])
    counter += 1
  end

  result
end

# ----- Further Exploration 1
# Blocks provide flexibility to our program due to their lenient arity (loose argument counts).
# We want to make our method more flexible by allowing the parameter to be any collection type and not just arrays.
# Our goal is to transform the input collection into a new collection - Let's assume an array. As the method implementor, we don't care how that transformation takes place - Let's let the block take care of that for us.
# Since blocks have lenient arity, when we iterate over the input collection, we can extract varying numbers of parameters from each iteration: `element1` and/or `element2`. We can then pass these element/s to the block that the method caller will implement. 
def map(collection)
  result = []
  collection.each { |element1, element2| result << yield(element1, element2) }
  result
end

p map([1, 3, 6]) { |value| value**2 } #== [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

