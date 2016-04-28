class Octal
  def initialize(input)
    @input = input
  end

  def to_decimal
    number_check
    input_nums = @input.chars.map(&:to_i)
    input_nums_size = input_nums.size

    input_nums.map! do |num|
      input_nums_size -= 1
      num * (8**input_nums_size)
    end
    input_nums.inject(:+)
  end

  private

  def number_check
    input_as_ord = @input.chars.map(&:ord)
    return unless (input_as_ord & [56, 57]).any? || 
                  (input_as_ord & (65..122).to_a).any? && 
                  (input_as_ord & (1..7).to_a).any?
    return @input = '0' 
  end

end
