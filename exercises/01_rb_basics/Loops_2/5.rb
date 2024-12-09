numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
# numbers << input
  numbers.push(input)
  break if numbers.size == 5
end

puts numbers