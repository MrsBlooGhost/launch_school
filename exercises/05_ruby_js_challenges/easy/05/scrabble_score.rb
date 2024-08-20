=begin
--- P
Task: Given a word, computes the Scrabble score for that word.
Input: a word (String)
Return: Scrabble score (Integer)
Intermediate: a hash (lookup table for score)

Rules:
- Tile scores:
    | Letter                       | Value |
    | A, E, I, O, U, L, N, R, S, T | 1 |
    | D, G                         | 2 |
    | B, C, M, P                   | 3 |
    | F, H, V, W, Y                | 4 |
    | K                            | 5 |
    | J, X                         | 8 |
    | Q, Z                         | 10 |
- Case-insensitive
- Non-letter characters just score 0
--- E
CABBAGE
- 3 points for `C`
- 1 point for each `A` (there are two)
- 3 points for `B` (there are two)
- 2 points for `G`
- 1 point for `E`
- Final score: 3 + 2*1 + 2*3 + 2 + 1 = 14
--- D

--- A
class Scrabble

constant hash `LETTER_SCORE`

constructor
- accepts a word as an argument
- upcase the word and save as instance variable `WORD`
- return 0 if input isn't a valid word
  - valid word consists of only characters from a-z/A-Z

instance method `score`
- convert `WORD` to an array of chars
- iterate through array, accessing each letter
  - if current letter is found in one of the hash keys, increment score
    - iterate through constant hash, accessing each key
      - check if current letter is found in current key. if so, increment score by current value.
- return score

class method `score`
- accepts word as argument
- leverage instance method `score`
=end

class Scrabble
  LETTER_SCORE =
    {
      "AEIOULNRST" => 1,
      "DG" => 2,
      "BCMP" => 3,
      "FHVWY" => 4,
      "K" => 5,
      "JX" => 8,
      "QZ" => 10
    }

  def initialize(word)
    @word = word.upcase if word
  end

  def score
    return 0 unless valid?(@word)
    @word.each_char.reduce(0) do |total_score, letter|
      total_score + tile_score(letter)
    end
  end

  def self.score(word)
    new(word).score
  end

  private

  def valid?(word)
    word =~ /[A-Za-z]/
  end

  def tile_score(letter)
    LETTER_SCORE.each do |key, value|
      return value if key.include?(letter)
    end
  end
end
