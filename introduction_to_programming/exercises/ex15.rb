arr = ["snow", "winter", "ice", "slippery", "salted roads", "white trees"]

arr.delete_if do |value|
   value.start_with?("s")	
end

puts "Here are the values left in the array after the first programme: #{arr}"

#arr = ["snow", "winter", "ice", "slippery", "salted roads", "white trees"]


arr.delete_if do |value|
   value.start_with?("s","w")
end

puts "Here are the values left in the array after the second programme: #{arr}"
