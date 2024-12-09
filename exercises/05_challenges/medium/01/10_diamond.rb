=begin
----- P
Input: a letter --> string
Return: a diamond, starting with 'A', with given letter at the widest point --> string

Rules:
- The first row contains one 'A'.
- The last row contains one 'A'.
- All rows, except the first and last, have exactly two identical letters.
- The diamond is horizontally symmetric.
- The diamond is vertically symmetric.
- The diamond has a square shape (width equals height).
- The letters form a diamond shape.
- The top half has the letters in ascending order.
- The bottom half has the letters in descending order.
- The four corners (containing the spaces) are triangles.

----- E
letter 'A':
A

letter 'C':
  A
 B B
C   C
 B B
  A

letter 'E':
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

E - index 4

line A: 4 ws, A, 0 ws     4 ws
line B: 3 ws, B, 1 ws, B, 3 ws
line C: 2 ws, C, 3 ws, C, 2 ws
line D: 1 ws, D, 5 ws, D, 1 ws
line E: 0 ws, E, 7 ws, E, 0 ws 
  --> letter, spaces, letter
total spaces: 9
outer whitespace: index
inner whitespace: (total spaces - 2) - (outer whitespace * 2)

----- D
class `Diamond`

class method `make_diamond`
- accepts letter as argument
- returns the diamond

----- A
class `Diamond`

class method `make_diamond`
- accepts letter as argument
- construct top half of diamond
  - initialize `top` to return value, unless letter is "A". if so, initialize `top` to empty string.
- construct widest point of diamond
- constructor lower half of diamond
  - initialize `bottom` to return value, unless letter is "A". if so, initialize `top` to empty string.
- return the result of concatenating all the return values

helper method `construct_top`
- initialize an array of upcased alphabetical chars from 'A' to given letter, exclusive
- initialize `total_spaces` to (array size * 2 + 1)
- iterate through array, accessing each letter and its index
  - initialize `outer_whitespace` to (array size - current index)
  - initialize `inner_whitespace` to (total_spaces - 2) - (outer whitespace * 2)
  - return the result of concatenating `outer_whitespace`, letter, `inner_whitespace`, letter, `outer_whitespace`, newline char

helper method `construct_bottom`
- initialize an array of upcased alphabetical chars from 'A' to given letter, exclusive
- iterate through reversed array, accessing each letter and its index
  - initialize `total_spaces` to (array size * 2 + 1)
  - initialize `outer_whitespace` to (current index + 1)
  - initialize `inner_whitespace` to (total spaces - 2) - (outer whitespace * 2)
  - output the result of concatenating `outer_whitespace`, letter, `inner_whitespace`, letter, `outer_whitespace`, newline char

helper method `construct_middle`
- initialize an array of upcased alphabetical chars from 'A' to given letter, exclusive
- initialize `total_spaces` to (array size * 2 + 1)
- initialize `inner_whitespace` to (total spaces - 2)
- output the result of concatenating `letter`, (" " * `inner_whitespace`), `letter`, newline char
=end

class Diamond
  def self.make_diamond(letter)
    top = letter == "A" ? "" : construct_top(letter)
    middle = construct_middle(letter)
    bottom = letter == "A" ? '' : construct_bottom(letter)

    "#{top}#{middle}#{bottom}"
  end

  class << self

    private
    
    def construct_top(letter)
      array = ('A'...letter).to_a
      total_spaces = array.size * 2 + 1
      result = []

      array.each_with_index do |letter, idx|
        outer_whitespace = array.size - idx
        inner_whitespace = (total_spaces - 2) - (outer_whitespace * 2)
        inner_whitespace = 0 if letter == "A"

        if letter == "A"
          inner_whitespace = 0
          result << (" " * outer_whitespace) + letter + (" " * outer_whitespace) + "\n"
        else
          result << (" " * outer_whitespace) + letter + (" " * inner_whitespace) + letter + (" " * outer_whitespace) + "\n"
        end
      end

      result.join
    end

    def construct_bottom(letter)
      array = ('A'...letter).to_a.reverse
      total_spaces = (array.size * 2) + 1
      result = []

      array.each_with_index do |letter, idx|
        outer_whitespace = idx + 1
        inner_whitespace = (total_spaces - 2) - (outer_whitespace * 2)
        
        if letter == "A"
          inner_whitespace = 0
          result << (" " * outer_whitespace) + letter + (" " * outer_whitespace) + "\n"
        else
          result << (" " * outer_whitespace) + letter + (" " * inner_whitespace) + letter + (" " * outer_whitespace) + "\n"
        end
      end

      result.join
    end

    def construct_middle(letter)
      return "A\n" if letter == "A"
      array = ('A'...letter).to_a
      total_spaces = (array.size * 2) + 1
      inner_whitespace = total_spaces - 2

      "#{letter}#{' ' * inner_whitespace}#{letter}\n"
    end
  end
end
