# When passing an array to a method, we need to be explicit in how we pass it. If we want to change that array into a list of items, we'll have to do so with the splat operator (`*`).

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*args, arg4|
  puts "#{args.join(", ")}"
  puts arg4
end

# 2
gather(items) do |arg1, *args, arg4|
  puts arg1
  puts "#{args.join(", ")}"
  puts arg4
end

# 3
gather(items) do |arg1, *args|
  puts arg1
  puts "#{args.join(", ")}"
end

# 4
gather(items) do |*args, arg4|
  puts "#{args.join(", ")}, and #{arg4}"
end