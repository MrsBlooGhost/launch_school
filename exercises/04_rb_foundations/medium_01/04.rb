# We start with an array `birds` that contains four birds, where two are raptors.
# We use our block variables to organize the array further. When we yield the array to the block, Ruby assigns the individual elements of the array to the different block variables. 
  # It assigns the first two birds to the underscore. The underscore tells Ruby that we aren't interested in those values. 
  # The splat operator on the name block variable tells Ruby to treat it as an array and assign all remaining arguments to it. We group the last two elements from the array into the `raptors` array. 

def categorize(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
categorize(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(", ")}" }