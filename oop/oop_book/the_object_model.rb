# How do we create an object in Ruby? 
# Give an example of the creation of an object.

# We create an object by instantiating and instance of a class. Ie:

# Class Cat
# end

# tom_cat = Cat.new

# What is a module? What is its purpose? 
# How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it properly.


# A module is a way of encapulating code so that it can be shared. However they 
# can not create an object.
# We can use them with our classes by mixing them in. When a module is included
# in a class any behavour/methods from the module can now be used in the class,
# any behaviour is inherited.


module Purr

  def purr(sound)
    puts sound
  end

end


class Cat
  include Purr
end

tom_cat = Cat.new
tom_cat.purr('meow')

p Cat.ancestors
p Purr.ancestors

