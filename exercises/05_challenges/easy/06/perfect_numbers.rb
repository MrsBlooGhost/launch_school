=begin
--- P
Task: Write a program that can tell whether a number is perfect, abundant, or deficient.
Input: a natural number (1, 2, 3, ...)
Return: a string "perfect", "abundant", or "deficient"
Intermediate: numbers and strings

Rules:
- Categorize based on a comparison between the number and its Aliquot sum.
- The Aliquot sum of a number is the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself).
- Perfect numbers have an Aliquot sum that is equal to the original number.
- Abundant numbers have an Aliquot sum that is greater than the original number.
- Deficient numbers have an Aliquot sum that is less than the original number.
- Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
--- E
6: perfect number
Divisors: 1, 2, and 3
Aliquot sum: 1 + 2 + 3 = 6

28: perfect number
Divisors: 1, 2, 4, 7, and 14
Aliquot sum: 1 + 2 + 4 + 7 + 14 = 28

15: deficient number
Divisors: 1, 3, and 5
Aliquot sum: 1 + 3 + 5 = 9

24: abundant number
Divisors: 1, 2, 3, 4, 6, 8, and 12
Aliquot sum: 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36
--- D

--- A
class PerfectNumber

class method `classify`
- accepts number as argument
  - raises StandardError if invalid number is passed
    - valid number is >= 1
- returns string indicating what type of number it is
  - Categorize based on a comparison between the number and its Aliquot sum.
    - The Aliquot sum of a number is the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself).
  - Perfect numbers have an Aliquot sum that is equal to the original number.
  - Abundant numbers have an Aliquot sum that is greater than the original number.
  - Deficient numbers have an Aliquot sum that is less than the original number. Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
=end

class PerfectNumber
  require 'prime'

  include Comparable

  def self.classify(number)
    raise StandardError unless number >= 1
    return "deficient" if number.prime?
    case aliquot_sum(number) <=> number
    when 0  then "perfect"
    when -1 then "deficient"
    when +1 then "abundant"
    end
  end

  class << self
    private

    def aliquot_sum(number)
      (1...number).select { |num| number % num == 0 }.sum
    end
  end
end
