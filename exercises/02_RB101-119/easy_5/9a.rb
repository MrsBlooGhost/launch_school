# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string, write a method that returns a new string that contains the value
# of the original string with all consecutive duplicate characters collapsed into
# a single character.

# Input: a string
# Output: a new string

# Rules
# Explicit:
# - You may not use the `String#squeeze` or `String#squeeze!` methods

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `crunch` that takes one parameter.
# 2. Extract all unique characters of input string to an array, including whitespace.
# 3. Convert the array back into a string, and return that string.


# ---------------- Code (translate algorithm to programming language) ----------------
def crunch(string)
  letter = ''
  counter = 0
  array_of_letters = []
  split_string = string.split. do |word|
    
  end
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''