Problem Description:


---------------- Problem (establish rules, define boundaries) ----------------
Re-write the problem statement.
Given an array of integers between 0 and 19, write a method that returns an array 
of those integers sorted in alphabetical order, based on the english words for 
each number.

Input: an array of integers between 0 and 19, inclusive
Output: an array of integers

Rules
Explicit:
- the method should return an array of the same integers, sorted based on 
alphabetical order of the english words for each integer
- the input array can contain integers from 0 to 19, inclusive

Implicit:
- each integer appears once in the input array

---------------- Examples (confirm/refute assumptions ----------------
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


---------------- Scratchpad ----------------



---------------- Data Structures (reason with data logically) ----------------
Create something to bridge the gap between input and output.



---------------- Algorithm (steps from input to output) ----------------
Write broad action steps to solve the problem. Create substeps for each broad action step. 
1. Create a reference array of the integer spelled out in english words. Write 
them in order from zero to nineteen.
2. Sort the input array by 


---------------- Code (translate algorithm to programming language) ----------------