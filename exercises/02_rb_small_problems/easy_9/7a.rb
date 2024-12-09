=begin
P-----
Write a method that determines the mean (average) of the three scores passed to
it, and returns the letter value associated with that grade.

Rules:
- Scores passed in are all between 0 and 100, inclusive.

Input: three integers representing scores
Return: a string representing a grade

E-----
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

A-----
  {'A' => (90..100), 'B' => (80...90), 'C' => (70...80), 'D' => (60...70), 'F' => (0...60)}
- Define a method `get_grade` with three parameters `score1`, `score2`, and `score3`.
- Initialize local variable `average_grade` to the result of adding the three
input scores and then dividing by 3.
- Find the key in `RUBRIC` associated with `average_grade` as a value.
  - Return this key.

C-----
=end

def get_grade(score1, score2, score3)
  average_grade = (score1 + score2 + score3) / 3

  case average_grade
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93)# == "A"
p get_grade(50, 50, 95)# == "D"