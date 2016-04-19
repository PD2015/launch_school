# 1)
# If we have this code:

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end
# What happens in each of the following cases:

# case 1:

# hello = Hello.new
# hello.hi
# The hi instance method is called in the Hello class, which in turn calls
#  the greet method ffrom the superclass and passes in the hi argument. Hello will be output.
# case 2:

# hello = Hello.new
# hello.bye
# An error will be raises as the bye method will be undefined for the instance of the Hello class.
# case 3:

# hello = Hello.new
# hello.greet
# The lookup chain will find the greet method in the superclass Greeting however an error will be 
# raised as no argument is passed in.
# case 4:

# hello = Hello.new
# hello.greet("Goodbye")
# As above except this time it will be executed as an argument in present. Goodbye will be output.
# case 5:

# Hello.hi
# There is no class method hi, only an instance method. Therefore this call on the Hello class 
# will raise and error.


# 2)
# with the above example.
# If we call Hello.hi we get an error message. How would you fix this?

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting

#   def self.hi
#     puts 'Hi'
#     # officical:
#     # greeting = Greeting.new
#     # greeting.greet("Hello")
#   end

#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end


# Hello.hi

# 3)
# Given the class below, how do we create two different instances of this class, 
# both with separate names and ages?

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# henry = AngryCat.new(13, 'henry')
# harry = AngryCat.new(7, 'harry')

# 4)
# Given the class below, if we created a new instance of the class and then 
# called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

# How could we go about changing the to_s output on this method to 
# look like this: I am a tabby cat? (this is assuming that "tabby" is the 
# type we passed in during initialization).

# class Cat
#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     puts " I'm a #{@type} cat"
#   end
# end

# tabby = Cat.new('tabby')
# tabby.to_s

# 6)
# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#     # this is using the setter method therefore self or @ is needed.
#   end

#   def display_age
#     age
#     # for getter, age by self is all thats needed.
#   end
# end

# ginger = Cat.new('tabby')
# p ginger.age
# ginger.make_one_year_older
# p ginger.age
# p ginger.display_age

# 7)




















