# 1)
# Which of the following are objects in Ruby?
# If they are objects, how can you find out what class they belong to?

# true
# "hello"
# [1, 2, 3, "happy days"]
# 142

# They are all objects. You can find out which type by .class.

# 2)

# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed. 
# How can you check if your Car or Truck can now go fast?

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# herby = Car.new
# herby.go_fast

# trevor = Truck.new
# trevor.go_fast

# 3)
# When we called the go_fast method from an instance of the Car class 
# (as shown below) you might have noticed that the string printed when we 
# go fast includes the name of the type of vehicle we are using. 
# How is this done?

# the .class method is called on self. 
# This will return the class of the object.
# The call is made within a string and is interpolated, therefore the to_s method will be
# called on it.

# 4)
# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# charles = AngryCat.new
# charles.hiss
# Using the .new after the class name will tell Ruby 
# this new object is an instance of AngryCat.

# 5)
# Which of these two classes has an instance variable and how do you know?

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# apple = Fruit.new('Apple')
# pepperoni = Pizza.new('Pep')
# p apple.instance_variables
# p pepperoni.instance_variables

# by looking at the @ this suggests intstance_variables. You can confirm by calling the 
# .instance_variables method.

# 6)
# What could we add to the class below to access the instance variable @volume?

# class Cube

#  * attr_accessor :volume

#   def initialize(volume)
#     @volume = volume
#   end

 
#   # def get_volume
#   #   p @volume
#   # end

#   # or *

#   *def get_volume
#     p volume
#   end

# end

# c = Cube.new(20)
# c.get_volume

# 7)
# What is the default thing that Ruby will print to the screen 
# if you call to_s on an object? Where could you go to find out if you want to be sure?

# By default if you call to_s you will be telling Ruby to print the object’s 
# class and an encoding of the object id to the console.

# 8)
# If we have a class such as the one below:

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# self refers to the object, the instance of the cat class.
# ****
# oficial:
# Firstly it is important to note that make_one_year_older is an instance 
# method and can only be called on instances of the class Cat. 
# Keeping this in mind the use of self here is referencing the instance 
# (object) that called the method - the calling object.

# 9)
# If we have a class such as the one below:

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# In the name of the cats_count method we have used self. 
# What does self refer to in this context?

# Here the use of self refers to the class itself. So this method call, is being 
# called on the class not on an instance of the class.

# ****
# oficial:
# Because this is a class method it represents the class itself, 
# in this case Cat. So you can call Cat.cats_count.

# 10)
# If we have the class below, what would you need to call to 
# create a new instance of this class.

# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

# b = Bag.new('black', 'leather')
# p b

