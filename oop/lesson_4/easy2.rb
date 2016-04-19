# You are given the following code:

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
# # What is the result of calling

# oracle = Oracle.new
# oracle.predict_the_future

# A new instance of the Oracle class will be intitialized, both instance methods will be
# called a string will be created from the combination of these two instance methods although 
# no output will be shown as no puts/print/p is used.

# official answer goes into detail about the sample method.

# 2)
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end
# # What is the result of the following:

# trip = RoadTrip.new
# p trip.predict_the_future

# the predict_the_future method will be first found in the parent class (Oracle), the call to 
# choices made within the predict_the_future method will first search the subcalss RoadTrip. 
# As there is also a choices method here, this will be used.

# every time ruby tries to resolve a method it will first look in for the method in the class
# of the calling object. Then take it from there.

# 3)
# How do you find where Ruby will look for a method when that method is called? 
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
# What is the lookup chain for Orange and HotSauce?

p Orange.ancestors
p HotSauce.ancestors

# it will first look in the class of the object that the method is being called on,
# then in the super class and so on. You can find out the chain of command(lookup chain)
# by calling ancestors.

