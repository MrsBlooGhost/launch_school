=begin
---P
Task: Create a custom set type. How it works internally doesn't matter, as long as it behaves like a set of unique elements that can be manipulated in several well defined ways.
Input:
Return:

Rules:
- Assume all elements of a set are numbers.
---A
class CustomSet

constructor
- accepts array of integer/s argument
- initializes `@set` instance variable to array argument
  - use default value of 0 if no argument is passed

instance method `empty?`
- returns boolean indicating if `@set` is empty.

instance method `contains?`
- accepts integer as argument
- returns boolean indicating if the set includes given integer

instance method `subset?`
- accepts instance of `CustomSet` as argument
- returns boolean indicating if calling object's `@set` values are all found in argument's `@set`

instance method `disjoint?`
- accepts instance of `CustomSet` as argument
- returns boolean indicating if `@set` of calling object and `@set` of argument object don't have shared elements

instance method `eql?`
- accepts instance of `CustomSet` as argument
- returns boolean indicating if `@set` of calling object and `@set` of argument object have the same unique values

instance method `==`
- returns boolean indicating if `set` of calling object is equal to set of other object

instance method `add`
- accepts integer as argument
- appends given integer to calling object's `@set` unless `@set` already contains it
- returns new instance of `CustomSet` whose `@set` contains the appended given integer

instance method `intersection`
- accepts instance of `CustomSet` as argument
- returns new instance of `CustomSet` with only the shared elements as state from the calling object and the argument

instance method `difference`
- accepts instance of `CustomSet` as argument
- returns new instance of `CustomSet` with state as the difference between calling object's `@set` minus argument's `@set`

instance method `union`
- accepts instance of `CustomSet` as argument
- returns new instance of `CustomSet` with state as the sum of the sorted unique elements from calling object's `@set` and argument's `@set`
=end

class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(number)
    set.include?(number)
  end

  def subset?(other)
    set.all? { |el| other.set.include?(el) }
  end

  def disjoint?(other)
    set.none? { |el| other.set.include?(el) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def ==(other)
    set == other.set
  end

  def add(number)
    set << number unless set.include?(number)
    self.class.new(set)
  end

  def intersection(other)
    shared = set.select { |el| el if other.set.include?(el) }
    self.class.new(shared)
  end

  def difference(other)
    difference = set - other.set
    self.class.new(difference)
  end

  def union(other)
    sum = set + other.set
    self.class.new(sum.sort.uniq)
  end
end
