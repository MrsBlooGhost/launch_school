=begin
--- P
Input: a string of digits (String of Digits)
Return: a list of all possible consecutive number series of a specified length (Array of Arrays of Integers)
Intermediate: an array (to store)
--- E
String "01234"
3-digit series: 012, 123, 234
4-digit series: 0123, 1234
6-digit series from a 5-digit string: throw an error
--- D

--- A
class Series

constructor
- accepts string digit as argument

instance method `slices`
- accepts specified length as argument
- returns a list of all possible consecutive number series of that length
- raise an ArgumentError if the length specified is greater than the length of the given string
=end

class Series
  def initialize(string_dig)
    @string_dig = string_dig
  end

  def slices(length)
    raise ArgumentError if length > @string_dig.length
    num_array = @string_dig.chars.map(&:to_i)
    result = []
    num_array.each_cons(length) do |digits|
      result << digits
    end
    result
  end
end
