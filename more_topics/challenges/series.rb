# take string
# find n number consectutive no's.
# output nested array.
# railse error if input smaller than slice size.

class Series
  def initialize(input)
    @input = input
  end

  def slices(length)
  #   x = length * .
  # # @input.scan(/(.{1})/)
    @input.scan(/.{"#{length}".to_i}/).map(&:to_i)

    # @input.chars.map{ |num| [num.to_i]}
  end
end