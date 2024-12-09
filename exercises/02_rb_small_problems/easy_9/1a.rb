=begin
P-----
Write a method that takes two arguments, an array and a hash. The array will
contain 2 or more elements that when combined with adjoining spaces, produces
a person's name. The hash will contain two keys, `:title` and `:occupation`,
and their appropriate values. The method should return a greeting that uses
the person's full name and mentions their title and occupation.

Rules:
- Case-sensitive
E-----
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

A-----
- Define a method `greetings` with two parameters `name` and `details`.
- Initialize a local variable `name` to input `name` array joined together with
a whitespace.
- Use string interpolation and hash element reference to output the greeting.

C-----
=end
def greetings(name, details)
  name = name.join(' ')
  puts "Hello, #{name}! Nice to have a #{details[:title]} #{details[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."