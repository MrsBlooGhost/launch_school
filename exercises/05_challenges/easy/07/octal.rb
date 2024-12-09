=begin
--- P
Task: Implement octal to decimal conversion.
Input: an octal input string (String)
Return: a decimal output (Integer)
Intermediate: an array to store data?

Rules
- Treat invalid input as octal 0.
  - invalid: Any input with chars other than 0-7
- Don't use any built-in or library methods that perform the necessary conversions for you.
- Decimal is a base-10 system. The n*th* digit gets multiplied by 10^n-1. All of these values are then summed.
- Octal numbers use a base-8 system. The n*th* digit gets multiplied by 8^n-1. All of these values are then summed.
--- E
  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 155
--- D

--- A
class Octal

constructor
- accepts octal number as argument
- if input is invalid, re-assign it to 0
  - invalid: Any input with chars other than 0-7

instance method `to_decimal`
- if input is 0, return 0
- convert given octal input to array of chars
- iterate through array in reverse (size of array) times, accessing each index and each char
  - multiply the integer version of char by 8^index.
  - store all products in a collection
- Sum value in the collection
=end

class Octal
  def initialize(octal)
    @octal = invalid?(octal) ? '0' : octal
  end

  def to_decimal
    return 0 if @octal == '0'

    result = []
    @octal.chars.reverse_each.with_index do |digit, index|
      result << (digit.to_i * (8**index))
    end
    result.sum
  end

  private

  def invalid?(octal)
    octal =~ /[^0-7]/
  end
end
