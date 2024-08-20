=begin
--- P
Task: Convert modern decimal numbers into their Roman number equivalents.
Input: a decimal number --- Integer
  - Upper limit: 3000, inclusive
Return: its Roman number equivalent --- String
Intermediate: a hash (lookup table for conversion)

Rules:
-    1  => I
     5  => V
    10  => X
    50  => L
   100  => C
   500  => D
  1000  => M
- Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.
--- E
1990 is MCMXC:
  1000=M
  900=CM
  90=XC

2008 is MMVIII:
  2000=MM
  8=VIII
--- D

--- A
class RomanNumeral
- constant hash consisting of roman numerals as keys and decimal numbers as values

constructor
- accepts decimal number as argument

instance method `to_roman`
- initialize result to empty array
- initialize `num` to given decimal number
- iterate through constant hash, accessing each key-value pair
  - divide `num` by current value
  - multiply current key by the quotient and push the resulting value to result array
  - join all strings in result array
=end

class RomanNumeral
  attr_accessor :num_to_convert

  ROMAN_TO_DECIMAL = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(num_to_convert)
    @num_to_convert = num_to_convert
  end

  def to_roman
    num = @num_to_convert
    result = []

    ROMAN_TO_DECIMAL.each do |roman, decimal|
      quotient, num = num.divmod(decimal)
      result << (roman * quotient)
    end

    result.join
  end
end
