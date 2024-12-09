# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string of words separated by spaces, write a method that returns the string
# but with the first and last letters of every word swapped.

# Input: a string of words separated by spaces
# Output: a string of the same words with the first and last letters of each word
# swapped

# Rules
# Explicit:
# - the first and last letters of each word should be swapped

# Implicit:
# - Case matters

# ---------------- Examples (confirm/refute assumptions ----------------
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `swap` that takes one parameter.
# 2. Move each word in the string to an array.
# 3. Iterate through the array and reverse each word. Create a new array and save
# the result of each word, with first and last letters swapped, there.
# 4. Convert the array back into a string.
# 5. Return the string.


# ---------------- Code (translate algorithm to programming language) ----------------
def swap(string)
  divided_string = string.split
  swapped_string = []
  divided_string.each do |word|
    if word.length > 1
      swapped_letters = word[-1] + word[1..-2] + word[0]
    else
      swapped_letters = word
    end
    swapped_string << swapped_letters
  end
  swapped_string.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'