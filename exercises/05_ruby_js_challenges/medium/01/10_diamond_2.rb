=begin
----- A

=end

class Diamond
  def self.make_diamond(letter)
    lines = multi_line(letter) + multi_line(letter).reverse[1..-1]
    lines.join
  end

  class << self
    private

    def self.multi_line(letter)
      widest = single_line(letter).length

      ('A'..letter).map do |current_letter|
        current_line = single_line(current_letter)

      end
    end

    def self.single_line(letter)
      case letter
      when 'A'
        'A'
      when 'B'
        'B B'
      else
        space_length = 1 + (2 * letter.ord - 'B'.ord))
        letter + (' ' * space_length) + letter
      end
    end
  end
end