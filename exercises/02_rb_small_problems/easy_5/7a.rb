# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Modify the `word_sizes` method from the previous exercise to exclude non-letters
# when determining word size.

# Input:
# Output:

# Rules
# Explicit:
# - Modify the method from the previous exercise to exclude non-letters
# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------



# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.



# ---------------- Code (translate algorithm to programming language) ----------------

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    non_letters = word.delete(/^a-z/)
    p non_letters
    counts[non_letters.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") #== { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') #== {}