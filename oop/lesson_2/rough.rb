class Player
  attr_accessor :name

end

class Human < Player

  def initialize
    @sports = [ ]
  end

  def sports
    @sports
  end

  def set_name
    puts "please set your name"
    ans = gets.chomp
    self.name = ans
  end

  def display_name
    puts name
  end
end

class Bob < Human

  def set_name
    puts "please set your name"
    ans = gets.chomp
    self.name = ans
  end

  
  def [](idx)
    sports[idx]
  end

  def display_name
    puts name
  end
end

one = Human.new
# p one.name
# one.set_name
# one.display_name
# p one.name

b = Bob.new
p b.name
b.set_name
b.display_name
p b.name
p b.sports
b.sports << "string"
p b.sports[0]
b.sports[1] = "billy"
p b[1]
p b.sports