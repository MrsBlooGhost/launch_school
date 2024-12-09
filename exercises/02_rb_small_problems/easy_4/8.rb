# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string of digits, write a method that returns the appropriate number of
# integers. The string may have a leading `+` or `-` sign. The method should return
# an integer with the appropriate leading sign. If no sign is given, it should
# return a positive number.

# Input: a string of digits
# Output: an integer, either positive or negative

# Rules
# Explicit:
# - If input string has no sign, return positive number.
# - If input string has leading `+`, return positive number.
# - If input string has leading `-`, return negative number.

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.

# 1. Use same steps from previous exercise but...
# 2. If string includes a leading `-`, make resulting integer negative.


# ---------------- Code (translate algorithm to programming language) ----------------

REFERENCE = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
'7' => 7, '8' => 8, '9' => 9, '10' => 10 }

def string_to_signed_integer(string)
  array = []
  string.chars.each do |x|
    if REFERENCE[x]
      array << REFERENCE[x]
    end
  end

  value = 0
  array.each { |digit| value = 10 * value + digit }
  value

  string.include?("-") ? -value : value

end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100