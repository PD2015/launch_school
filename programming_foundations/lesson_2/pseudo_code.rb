
# 1) a method that returns the sum of two integers
# 2) a method that takes an array of strings, and returns a string that is all those strings concatenated together
# 3) a method that takes an array of integers, and returns a new array with every other element

# 1) ==========================

# given two integers
# - add the two integers
# - return the sum 

#  ----------

# START

# GET integer_1. Store as integer
# SET Integer_1 = value given

# GET integer_2. Store as integer
# SET Integer_2 = value given

# PRINT Integer_1 + Integer_2

# END

#    ---------


# puts "Please enter value 1"
# integer_1 = gets.chomp.to_i

# puts "Please enter value 2"
# integer_2 = gets.chomp.to_i

# puts "The sum of your values is #{integer_1 + integer_2}" 

# or ---------

# def sum(integer_1, integer_2)
#   puts "The sum of your values is #{integer_1 + integer_2}"
# end

# puts sum(2, 2)

# 2) ==========================
# a method that takes an array of strings, and returns a string that is all those strings concatenated together
# -------------------

# Given an array of strings
 
# concatenate each sting in the array

# return the output.
 
 # ----------------

# START
# Given an array
# SET sentence = array concatentated
# PRINT sentence
# END

# --------------
# array = ["This", "is", "an", "array", "of", "strings."]
# sentence = array.join(" ")
# print sentence

# 3) =====================
# a method that takes an array of integers, and returns a new array with every other element
# -------------
# given an array of integers
# create new empty array as array2
# iterate through the original array
# add each value to array2
# print array2
# ------------------
# START
# Given array1
# SET array2 = empty
# Iterate over array 1
# add each value to array2
# PRINT array2
# END
# --------------

# array1 = [1, 2, 3, 4, 5, 6, 7]
# -------
# array2= []
# array1.each do |value| 
#   array2 << value 
# end
# ------
# array3 = array1.map







