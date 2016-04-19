# 4)
# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single method called greet that takes a string 
# argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello and one 
# called Goodbye. The Hello class should have a hi method that takes no arguments and 
# prints "Hello". The Goodbye class should have a bye method to say "Goodbye". 
# Make use of the Greeting class greet method when implementing the Hello and Goodbye 
# classes - do not use any puts in the Hello or Goodbye classes.

# class Greeting
#   def greet(string)
#     puts string
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet('Goodbye')
#   end
# end

# h = Hello.new
# h.hi
# gb = Goodbye.new
# gb.bye

# 5)
# And the following specification of expected behavior:
# Write additional code for KrispyKreme such that the puts 
# statements will work as specified above.

# puts donut1
#   => "Plain"

# puts donut2
#   => "Vanilla"

# puts donut3
#   => "Plain with sugar"

# puts donut4
#   => "Plain with chocolate sprinkles"

# puts donut5
#   => "Custard with icing"

class KrispyKreme

  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  # def to_s
  #   if filling_type != nil && glazing != nil
  #     "#{filling_type} with #{glazing}" 
  #   elsif filling_type != nil && glazing == nil
  #       filling_type
  #   elsif filling_type == nil && glazing != nil
  #     "Plain with #{glazing}"
  #   elsif filling_type == nil && glazing == nil
  #       "Plain"
  #   end
  # end

  def to_s
    filling_string = filling_type ? filling_type : "Plain" 
    glazing_string = glazing ? " with #{glazing}" : ''
    filling_string + glazing_string
  end
end


donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

