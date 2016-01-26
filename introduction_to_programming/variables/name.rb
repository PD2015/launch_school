puts "Please enter your name first name"
fname = gets.chomp
puts "Please enter your name last name"
lname = gets.chomp
puts "Hello #{fname} #{lname}, nice to meet you"
10.times do
  puts fname + lname
end 
