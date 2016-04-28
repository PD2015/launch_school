class Octal
  def initialize(input)
    @input = input
  end

  def to_decimal
    return 0 unless valid_input_check
    @input.chars
         .map(&:to_i)
         .reverse
         .each_with_index
         .map { |num, i| num * (8**i) }
         .inject(:+)
  end

  private

  def valid_input_check
    invalid_chars = [56, 57] + (65..122).to_a
    return true unless (@input.chars.map(&:ord) & invalid_chars).any?                   
  end

end
