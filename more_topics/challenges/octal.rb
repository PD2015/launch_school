require 'pry'
class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    number_check
    input_number_ary = @number.chars.map(&:to_i)
    input_number_ary_size = input_number_ary.size

    octal_no = input_number_ary.each_with_index.map do |number, index|
      input_number_ary_size -= 1
      number* (8**input_number_ary_size)
    end
    octal_no.inject(:+)
  end


  private
  def number_check
    # string contain 8 or 9?
    if  (@number.chars.map(&:ord) & [56, 57]).any?
      return @number = '0'
     # string contain letter and number 1..7? 
    elsif (@number.chars.map(&:ord) & (65..122).to_a).any? && 
          (@number.chars.map(&:ord) & (1..7).to_a).any?
      return @number = '0'
    else
      return 
    end
  end

end






# powers_array = (0..(input_number_ary_size-1)).to_a
    # binding.pry
    # octal_array = []
    # input_number_ary_size.times do
    # octal_array << [input_number_ary.shift, powers_array.pop]  
    # end
    # octal_array