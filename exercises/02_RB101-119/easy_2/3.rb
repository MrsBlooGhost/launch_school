# ---------------- Problem
# Re-write the problem statement.
# Create a program that prompts the user for the bill amount and a tip rate, then
# computes the tip, and displays both the tip and the total amount of the bill.

# Input: bill amount, tip rate
# Output: tip amount, total bill amount

# Rules (implicit and explicit):


# ---------------- Examples
# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each
# broad action step.
# 1. Prompt user for bill amount, convert to float, save input in variable
# `bill_amt`.
# 2. Prompt user for tip rate, convert to float, divide it by 100, save input in
# variable `tip_rate`.
# 3. Multiply `bill_amt` by `tip_rate`, round value to hundredths place, save
# value in variable `tip_amt`.
# 4. Add `tip_amt` to `bill_amt`, save value in variable `total_bill_amt`.
# 5. Display tip amount and total bill amount values in sentence form.

# ---------------- Code

puts "What is the bill?"
bill_amt = gets.to_f
puts "What is the tip percentage?"
tip_rate = gets.to_f / 100

tip_amt = (bill_amt * tip_rate).round(2)
total_bill_amt = tip_amt + bill_amt

puts "The tip is $#{tip_amt}"
puts "The total is $#{total_bill_amt}"