=begin
--- P
Task: Calculate the Hamming distance between two DNA strands.
Input: two DNA strands --- Strings
Return: the Hamming distance --- Integer
Intermediate: Integer (to count the differences)

Rules:
- A point mutation replaces one base with another at a single nucleotide.
- The Hamming distance between two DNA strands is the number of differences between the two strands.
- The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, compute the Hamming distance over the shorter length.
--- E
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.
--- D

--- A
class DNA

constructor
- accepts one DNA strand (string) as argument

instance method `hamming_distance`
- accepts one DNA strand (string) as argument
- determine which strand is shorter.
- initialize counter to 0.
- iterate through the shorter strand.
  - compare current nucleotide with nucleotide in comparison strand.
  - increment counter if the two nucleotides are not the same.
- return counter.
=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    short, long = [@strand, comparison].sort_by(&:size)
    count = 0

    short.each_char.with_index do |nucleotide, index|
      count += 1 if nucleotide != long[index]
    end

    count
  end
end
