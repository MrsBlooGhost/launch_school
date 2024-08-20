=begin
--- P
Task: Determine whether a triangle is equilateral, isosceles, or scalene.
Input: 3 side lengths --- Integers
Return: Equilateral, isoceles, or scalene --- String
Intermediate: Array (to collect side lengths)

Rules:
- Equilateral triangle: three sides are the same length.
- Isosceles triangle: two sides are the same length.
- Scalene triangle: All sides are different lengths.
- A triangle is a shape whose sides are of length > 0, and the sum of the lengths of any two sides are greater than the length of the third side.
--- E

--- D

--- A
class Triangle

Constructor
- Accepts three side lengths as arguments
- Raise ArgumentError unless the three side lengths form a valid triangle:
  - Accepts three side lengths as arguments
  - Return true if all lengths are > 0, and the sum of the lengths of any two sides are greater than the length of the third side.

Instance method `kind`
- Return "equilateral" if three sides are the same length.
- Return "isosceles" if two sides are the same length.
- Return "scalene" if all sides are different lengths.
=end

class Triangle
  attr_reader :sides

  def initialize(length1, length2, length3)
    @sides = [length1, length2, length3]
    raise ArgumentError unless valid_triangle?(sides)
  end

  def kind
    case sides.uniq.count
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  private

  def valid_triangle?(lengths)
    return false unless lengths.all? { |length| length > 0 }
    lengths[0] + lengths[1] > lengths[2] &&
      lengths[0] + lengths[2] > lengths[1] &&
      lengths[1] + lengths[2] > lengths[0]
  end
end
