# We yield the `items` array to the block. Moving the implementation of our `items` formatting to the block gives the user more flexibility and vhoice for how they wish to use `gather`.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) {puts "#{items.join(' + ')}"}