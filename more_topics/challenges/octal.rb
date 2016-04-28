require 'pry'
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
    return true unless (@input.chars.map(&:ord) - (48..55).to_a).any?                   
  end

end
