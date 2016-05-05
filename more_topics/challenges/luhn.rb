class Luhn
  def initialize(input)
    @input = input.to_s.split('').map(&:to_i)
  end

  def addends
    @input.reverse.each_with_index.map do |num, idx|
      (idx + 1).even? ? num_conversion(num * 2) : num
    end.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(input)
    Luhn.new(input).valid? ? input : num_to_a(input).push(detect_required_num(input))
                                                    .join
                                                    .to_i
  end

  private

  def num_conversion(num)
    num > 9 ? num - 9 : num
  end

  def self.num_to_a(num)
    num.to_s.split('').map(&:to_i)
  end

  def self.detect_required_num(input)
    (0..9).to_a.detect do |num|
      Luhn.new(num_to_a(input).push(num).join).valid?
    end
  end
  private_class_method :num_to_a, :detect_required_num
end
