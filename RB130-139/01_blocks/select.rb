=begin
select
- takes array as argument
- iterates over each element, passing it to a block
  - block returns a boolean based on the last evaluated expression of the block
- returns a new array of elements for which the block returns true
=end

array = [1, 2, 3, 4, 5]

# using while loop
def select(array)
  counter = 0
  result = []

  while counter < array.size
    result << array[counter] if yield(array[counter])
    counter += 1
  end

  result
end

# using Array#each
def select(array)
  result = []

  array.each do |element|
    result << element if yield(element)
  end

  result
end

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }


