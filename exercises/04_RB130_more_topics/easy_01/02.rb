# --- Solution 1
def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# --- Solution 2
# The `Kernel#block_given?` method is used to detect if a block has been passed to the `compute` method. If so, we yield to it and return the value yielded by the block. If not, we return the string 'Does not compute.'. 

def compute
  return 'Does not compute.' unless block_given?
  yield
end

# --- Further Exploration 1
def compute(arg)
  return 'No block was given!' unless block_given?
  yield(arg)
end

compute(10) { |arg| arg + 5 } == 15
compute('hi') { |arg| arg + 'there' } == 'hi there'
compute('hmm') == 'No block was given!'