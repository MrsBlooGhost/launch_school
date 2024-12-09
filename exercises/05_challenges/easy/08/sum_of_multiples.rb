=begin
--- P
Task: find the sum of all the multiples of the numbers in the set that are less than the first number
Input: a natural number and a set of 1+ number/s
  - If set is not given, use default of 3 and 5
Return: the sum of all multiples of given number in the set that are less than the given number
Intermediate: an array (to store set)
--- E
number: 20
set: 3 and 5
multiples: 3, 5, 6, 9, 10, 12, 15, and 18
sum of multiples: 78
--- D

--- A
class SumOfMultiples

constructor
- accepts set of numbers as argument, save in an array

instance method `to`
- accepts natural number as argument. if set is not given, use default of 3 and 5
- find multiples of numbers in the set that are less than the given number
- returns sum of multiples

class method `to`
- leverage instance method `to`
=end

class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def to(number)
    multiples(number).sum
  end

  def self.to(number)
    new.to(number)
  end

  private

  def multiples(number)
    (1...number).select do |num|
      @set.any? { |set_num| num % set_num == 0 }
    end
  end
end
