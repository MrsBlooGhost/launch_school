# ---------------- Problem
# Re-write the problem statement.
# Given a positive integer, write a method that takes a positive integer, `n`, and
# displays a right triangle whose sides have `n` stars. The hypotenuse of the
# triangle should have one end at the lower left corner and the other end at the
# top right corner.

# Input: a positive integer
# Output: display of a right triangle whose hypotenuse runs from the lower left
# to the top right

# Rules (implicit and explicit):
# Explicit:
# - length of the sides of the trinagle are `n` stars long
# - the hypotenuse (diagnonal side) of the triangle runs from the lower left corner
# to the top right corner
# Implicit:
# - the entire triangle is filled with stars
# - the last row of the triangle is filled with `n` stars
# - each row up from the last row of the triangle is filled with (`n` - 1) stars,
# decrementing
# - each row up from the last row of the triangle is right-justified by 1 star,
# incrementing

# ---------------- Examples
# triangle(5)

#     *
#   **
#   ***
# ****
# *****

# triangle(9)

#         *
#       **
#       ***
#     ****
#     *****
#   ******
#   *******
# ********
# *********


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `triangle` that takes one argument `n`.
# 2. Initialize a `counter` variable to `1`.
# 3. Print (`n - counter`) whitespaces and (`*` * `counter`).
# 4. Repeat step 3, incrementing `counter` by 1, until `counter` is greater than `n`.

# ---------------- Code

def triangle(n)
  counter = 1
  until counter > n
    puts (" " * (n - counter)) + ("*" * counter)
    counter += 1
  end
end

triangle(5)
triangle(9)