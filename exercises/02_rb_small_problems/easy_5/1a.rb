# Problem Description:
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the ASCII
# values of every character in the string. (You may use `String#ord` to determine
# the ASCII value of a character.)


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string, write a method that determines and returns the ASCII string value
# of the given string. The ASCII string value is the sum of the ASCII values of every
# character in the string.

# Input: a string
# Output: an integer

# Rules
# Explicit:
# - The ASCII string value is the sum of the ASCII values of every character in
# the string
# - Use the `String#ord` method to determine the ASCII value of a character.

# Implicit:
# - If input string is empty, return 0.

# ---------------- Examples (confirm/refute assumptions ----------------
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.
# - Array?


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `ascii_value` that takes one parameter.
# 2. If given string is empty, return 0.
# 3. Iterate through given string and determine ASCII value of each character.
#   - Add the ASCII value to an array `values`.
# 4. Sum up the values of all the elements in the array.
# 5. Return this sum.


# ---------------- Code (translate algorithm to programming language) ----------------
def ascii_value(string)
  if string.empty?
    0
  else
    count = 0
    values = []
    loop do
      break if count == string.size
        values << string[count].ord
      count += 1
    end
    sum = 0
    values.each do |num|
      sum += num
    end
    sum
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0