=begin
reduce
- takes array (more accurately, a collection) as argument
- iterates over array, yielding an accumulator object and the current element to the block
  - accumulator object is re-assigned the return value of the block
  - accumulator object is used on the next yield to the block
- returns the accumulator object after iteration is done
=end

def reduce(array, acc = array[0])
  counter = 0
  
  while counter < array.size
    current_element = array[counter + 1]
    acc = yield(acc, current_element)
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }       # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }   # => [1, 2, 'a', 'b']
