=begin
P-----
Write a method that returns 2 times the number argument, unless the number is a
double number. Double numbers should be returned as-is.

Rules:
- A double number is a number with an even number of digits whose left-side
digits are exactly the same as its right-side digits.
  Ex: Double numbers - 44, 3333, 103103, 7676
      Not double numbers - 444, 334433, 107

E-----
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

A-----
HELPER METHOD
- Define a method `double_number?` with one parameter `number`.
- Convert `number` to a string and assign return value to local variable `string_num`.
- Check if `number`'s size is even.
  - If so, move on...
  - If not, return `false`.
- Check if `number`'s left-side digits are exactly the same as its right-side digits.
  - Convert `number` to a string.
  - Obtain size of the string.
  - Check if the elements of the string at index 0..(size/2-1) is equal to the elements
  of the string at index (size/2)..-1.
    - If so, return `true`.
    - If not, return `false`.

MAIN METHOD
- Define a method `twice` with one parameter `number`.
- Determine if `number` is a double number. (HELPER METHOD)
  - If so, return `number`.
  - If not, multiply `number` by 2 and return the return value.

C-----
=end
def double_number(number)
  string_num = number.to_s
  center = string_num.size / 2
  left_side = center.zero? ? '' : string_num[0..center-1]
  right_side = string_num[center..-1]
  left_side == right_side
end


def twice(number)
  double_number(number) ? number : (number*2)
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10