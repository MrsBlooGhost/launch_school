say_hello = true
counter = 1

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter > 5
end