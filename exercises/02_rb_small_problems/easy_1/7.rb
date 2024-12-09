# ---------------- Problem
# Re-write the problem statement.
# Prompt the user for a noun, a verb, an adverb, and an adjective, and inject
# those into a story.

# Input: 4 strings: a noun, a verb, an adverb, and an adjective
# Output: a string

# Rules (implicit and explicit):
# Explicit:
# - Prompt the user for a noun, a verb, an adjective, and an adverb
# - Output a sentence using the 4 input strings.

# ---------------- Examples
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Prompt the user for a noun, a verb, an adjective, and an adverb and save them
# into variables `noun`, `verb`, `adjective`, and `adverb`, respectively
# 2. Define a method `madlibs` that takes four arguments: `noun`, `verb`, `adverb`,
# and `adjective`.
# 3. Output a string that uses the four arguments.

# ---------------- Code

puts "Enter a noun:"
noun = gets.chomp
puts "Enter a verb:"
verb = gets.chomp
puts "Enter an adjective:"
adjective = gets.chomp
puts "Enter an adverb:"
adverb = gets.chomp

def madlibs(noun, verb, adverb, adjective)
  puts "Do you #{verb} your #{adverb} #{noun} #{adjective}? That's hilarious!"
end

madlibs(noun, verb, adjective, adverb)