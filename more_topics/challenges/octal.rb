require 'pry'
class Octal
  def initialize(input)
    @input = input.chars
  end

  def to_decimal
    return 0 unless valid_input_check
    @input.map(&:to_i)
          .reverse
          .each_with_index
          .map { |num, i| num * (8**i) }
          .inject(:+)
  end

  private

  def valid_input_check
   return true unless @input.any? {|num| num =~ /[^0-7]/ }                  
  end

end
