a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

# an error is raised: undefined local variable or method `a` on line 4