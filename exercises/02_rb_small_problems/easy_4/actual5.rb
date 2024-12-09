# Problem Description:
# Write a method that searches for all multiples of 3 or 5 that lie between 1 and
# some other number, and then computes the sum of those multiples. For instance,
# if the supplied number is `20`, the result should be `98`
#   (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20). You may assume that the number
#   passed in is an integer greater than 1.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given an integer greater than 1, write a method that searches for all multiples
# of 3 and 5 that lie between 1 and the given integer, inclusive. The method then
# computes the sum of these integers and returns it.

# Input: an integer > 1
# Output: an integer representing a sum

# Rules
# Explicit:
# - input integer > 1
# - method searches for all multiples of 3 and 5 between 1 and the given integer,
# inclusively
# - method returns sum of these integers

# Implicit:
# - only sum unique numbers
# ---------------- Examples (confirm/refute assumptions ----------------
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `multisum` that takes one parameter.
# 2. Initialize variable `multiples_of_3`. Push integers that are multiples of 3
# between 1 and the given integer, inclusively, to this variable.
# 3. Initialize variable `multiples_of_5`. Push integers that are multiples of 5
# between 1 and the given integer, inclusively, to this variable.
# 4. Sum unique integers in both variables together.
# 5. Return integer from step 4.

# ---------------- Code (translate algorithm to programming language) ----------------

# SOLUTION 1
# def multisum(integer)
#   multiples_of_3 = (1..integer).select { |num| num % 3 == 0 }
#   multiples_of_5 = (1..integer).select { |num| num % 5 == 0 }

#   array = multiples_of_3 + multiples_of_5
#   array.uniq.sum
# end


# SOLUTION 2
def multisum(integer)
  array = []
  1.upto(integer) do |x|
    if x % 3 == 0 || x % 5 == 0
      array << x
    end
  end
  array.uniq.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168