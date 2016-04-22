require 'pry'


# Select method
# def select(array)
#   counter = 0
#   new_array = []

#   while counter < array.size
#     if yield(array[counter])
#       new_array << array[counter]
#     end
#       counter += 1 
#   end

#   new_array
# end

# array = [1, 2, 3, 4]

# select(array) { |num| num.odd? }

# inject/reduce method
def inject(array, default= 0 )
  counter = 0
  acc = default
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  p acc
end

array = [1, 2, 3, 4, 5]

inject(array) { |acc, num| acc + num }


