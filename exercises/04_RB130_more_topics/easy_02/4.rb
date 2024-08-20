=begin
# ----- P
Background: The `Enumerable#count` method iterates over the members of a collection, passing each element to the associated block. It then returns the number of elements for which the block returns a truthy value. 

Task: Write a method `count` that behaves similarly.

Rules
- Input: 0 or more arguments, and a block
- Return: an integer representing the total number of arguments for which the block returns true
  - If the argument list is empty, return 0.
- Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#reduce`, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# ----- E
count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3

# ----- A1
- Define a method that can take multiple arguments.
- Initialize `result` to 0.
- Place the argument/s in an array and iterate over array, accessing each element.
  - Yield to the block, passing in each argument.
    - If block returns true, increment `result` by 1.
- Return `result`.

=end
# ----- C1 Using `#each`
# We iterate through the arguments, incrementing our total each time `yield(element)` returns a truthy value.
# We use `*arg` in the method definition, which lets us treat the list of arguments as an array of values.
def count(*arg)
  result = 0
  [*arg].each do |element|
    result += 1 if yield(element)
  end
  result
end

# ----- C2 Using `#reduce`
def count(*arg)
  [*arg].reduce(0) do |result, element|    
    yield(element) ? result + 1 : result
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3