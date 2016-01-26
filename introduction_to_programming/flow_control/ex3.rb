puts "pick a number, any number...(between 0 and 100)"
 no = gets.chomp.to_i

  if no < 0
    puts "You can't enter a negative number!"
  elsif no <= 50
    puts "#{no} is between 0 and 50"
  elsif no <= 100
    puts "#{no} is between 51 and 100"
  else no > 100
    puts "your number(#{no}) was greater than 100. You were supposed to choose a number between 0 and 100"
  end
 
