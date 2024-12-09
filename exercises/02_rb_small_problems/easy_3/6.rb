# Problem Description:
# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.
# Note that we are looking for a boolean result instead of a truthy/falsy value
# as returned by || and &&.

# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method `xor` that takes two arguments, and returns `true` if exactly
# one of its arguments is truthy, and `false` otherwise.

# Input: two arguments
# Output: a boolean value

# Rules
# Explicit:
# - the method `xor` takes two arguments
# - the method `xor` returns `true` if exactly one of its arguments is truthy,
# and returns `false` otherwise

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `xor?` that takes two arguments.
# 2. Return `true` if the first argument has a truthy value and the second argument
# has a falsy value. Return `false` if both the first and second argument are truthy.
#   - Evaluate the first argument for truthiness.
#   - If it has a truthy value, evaluate the second argument for truthiness.
#   - If the second argument is also truthy, then return `false`. If it is falsy,
#   then return `true`
# 3. Return `true` if the first argument has a falsy value and the second argument
# has a truthy value. Return `false` if both the first and second argument are falsy.
#   - Evaluate the first argument for falsiness.
#   - If it has a falsy value, evaluate the second argument for truthiness.
#   - If the second argument is also falsy, then return `false`. If it is truthy,
#   then return `true`.


# ---------------- Code (translate algorithm to programming language) ----------------
def xor?(value1, value2)
  if value1
    if value2
      false
    else
      true
    end
  else
    if value2
      true
    else
      false
    end
  end
end
