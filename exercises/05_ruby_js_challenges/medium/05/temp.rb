def echo_with_yield(str)
  yield if block_given?
  str
end


# p echo_with_yield("hello", "world!")
p echo_with_yield("hello", "world!") { puts "world" } 