=begin
P-----
Write a method that takes two arguments: 1) the starting number, 2) the ending
number. Print out all numbers from the starting number to the ending number,
except if it is divisible by 3, print "Fizz", if it's divisible by 5, print "Buzz",
and if it's divisible by 3 and 5, print "FizzBuzz".

Rules:
- Print "Fizz" if number is divisible by 3
- Print "Buzz" if number is divisble by 5
- Print "Fizzbuzz" if number is divisible by 3 and 5
- Otherwise, just print number.

Input: two integers
Return: Outputs of either the integer, "Fizz", "Buzz", or "FizzBuzz"

E-----
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

A-----
- Define a method `fizzbuzz` with two parameters, `start_num` and `end_num`.
- Initialize local variable `array_of_nums` to an array of numbers starting at
`start_num` and ending at `end_num`, inclusive.
- Iterate through `array_of_nums`:
  - If current element is divisible by 3, print "Fizz".
  - If current element is divisible by 5, print "Buzz".
  - If current element is divisible by both 3 and 5, print "FizzBuzz".
  - If current element is neither divisible by 3 nor 5, print current element.

C-----
=end

def fizzbuzz(start_num, end_num)
  result = []
  start_num.upto(end_num) do |num|
    result << fizzbuzz_value(num)
  end
  puts result.join(', ')
end

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 5 == 0
    'Buzz'
  when num % 3 == 0
    'Fizz'
  else
    num
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz