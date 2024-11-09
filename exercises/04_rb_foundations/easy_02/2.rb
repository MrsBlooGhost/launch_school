=begin
# ----- P
Background: The `Array#zip` method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order.

Task: Write your own version of `zip` that does the same type of operation. 

Rules
- Input: two arrays with the same number of elements
- Return: a new array
- You may not use the built-in `Array#zip` method.

# ----- E
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# ----- A1
- Initialize `result` to empty array.
- Iterate (size of first array) times.
  - Append to `result` an array containing two elements: element at current index in first array and element at current index in second array.
- Return `result`.

=end
# ------ C1
def zip(arr1, arr2)
  result = []
  arr1.size.times do |idx|
    result << [arr1[idx], arr2[idx]]
  end
  result
end

# ----- C2
# For this problem, we iterate N times, where N is the number of elements in each of our two arrays.
# All we need to do is set up our result array, initialize the index, iterate, then return the result.
# During each iteration, we append the appropriate elements, as a two-element array, to our result array, and increment the index.

def zip(arr1, arr2)
  result = []
  index = 0
  length = arr1.length
  while index < length
    result << [arr1[index], arr2[index]]
    index += 1
  end
  result
end

# ----- C3
# C2 can be simplified by recognizing that the loop in C2 is what `Array#each_with_index` does.

def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |element, index|
    result << [element, arr2[index]]
  end
  result
end

# ----- C4
# Even more succinctly...

def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, arr2[index]]
  end
end

# ----- C5
def zip(arr1, arr2)
  (0...arr1.size).map { |idx| [arr1[idx], arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]