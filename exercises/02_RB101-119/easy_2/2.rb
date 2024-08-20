# ---------------- Problem
# Re-write the problem statement.
# Build a program that does the following:
# - Asks the user for the length and width of a room, in meters.
# - Displays the area of the room in square meters and in square feet.

# Input: length and width of room (meters)
# Output: area of room (square meters, square feet)

# Rules (implicit and explicit):
# Explicit:
# - 1 square meter == 10.7639 square feet
# - Don't validate input at this time.
# Implicit:
# - Area = length * width


# ---------------- Examples
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Ask user for length of room in meters, convert to float, and save input
# in variable `length`.
# 2. Ask user for width of room in meters, convert to float, and save input
# in variable `width`.
# 3. Calculate area of room (length * width) in square meters, save value in
# variable `area_sq_m`.
# 4. Calculate area of room (length * width) in square feet using provided
# formula ( 1 square meter == 10.7639 square feet), save value in variable `area
# _sq_ft`.
# 5. Display calculated area from step 3 (square meters) and step 4 (square feet)
# with square feet rounded to hundredths place.

# ---------------- Code

puts "Enter the length of the room in meters:"
length = gets.to_f
puts "Enter the width of the room in meters:"
width = gets.to_f

area_sq_m = length * width
area_sq_ft = area_sq_m * 10.7639
puts "The area of the room is #{area_sq_m} (#{area_sq_ft.truncate(2)} square feet)."