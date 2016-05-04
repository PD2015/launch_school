# add 2 to every other number from right to left
# disreguard _
# return array of modified numbers

# take output of addends and find total

# check the validity of test_number
  # 738 = 768 = 20 = false ? < 4 
  # 8_739_567 = 8_539_537 = 40 = true


# create. will need to take number convert it and calculate total.
class Luhn

  def initialize(test_number)
    @test_number = test_number.to_s.split('').map(&:to_i)   
  end

  def addends
    new_array = []
    @test_number.reverse.each_with_index do |num, idx|
      if (idx + 1).even?
        new_array <<  number_conversion_if_greater_than_9(num*2)
      else
        new_array << num  
      end
    end
    new_array.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def valid? 
    checksum % 10 == 0 && @test_number.size > 3 
  end

  def self.create(input)
    new_test = Luhn.new(input)
    return input if new_test.checksum % 10 == 0  
     new_checksum_ary = input.to_s.split('').map(&:to_i) << detect_required_num(input)
     new_checksum_ary.join.to_i
  end

  private

  def number_conversion_if_greater_than_9(num)
   return num unless num > 9
     num - 9
  end

  def self.detect_required_num(input)  
    (0..9).to_a.detect do |num|
      trial_input_ary = input.to_s.split('').map(&:to_i) << num
      trial_checksum = Luhn.new(trial_input_ary.join)
      trial_checksum.checksum % 10 == 0
    end
  end


end

luhn = Luhn.new(4913)