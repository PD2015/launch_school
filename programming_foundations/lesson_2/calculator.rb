
# ask for two numbers
# ask for the type of operation to perform: add, subtract, multiply or divide
# display the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_f != 0.0
end

prompt("Welcome to the caluculator programme. Please enter your name..")

name = ''
loop do
  name = gets.chomp.downcase
  if name.empty?
    prompt("Sorry your name can't be emtpy, please enter your name:")
  else
    break
  end
end

loop do # main programme loop.
  no_1 = ''
  no_2 = ''
  operation = ''


  loop do # number 1 loop
    prompt("Hello #{name}, please enter a number...")
    no_1 = gets.chomp.to_f
    if valid_number?(no_1)
      break
    else
      puts "Sorry thats not a valid number"
    end
  end


  loop do #number 2 loop
    prompt("Please enter a second number...")
    no_2 = gets.chomp.to_f
    if valid_number?(no_2)
      break
    else
      puts "Sorry thats not a valid number"
    end
  end

  operation_prompt = <<-MSG
  What operation would you like to perform with these two numbers?
    > add(+)
    > subtract(-)
    > multiply(*)
    > divide(/)

  MSG
  prompt(operation_prompt)

  loop do # operation loop
    operation = gets.chomp.downcase
    if %w(+ - * /).include?(operation)
      break
    else
      puts "Oops! You must choose +, -, * or /"
    end
  end

  result = case operation
    when "+"
       no_1 + no_2
    when "-"
       no_1 - no_2
    when "*"
      no_1 * no_2  
    when "/"
      no_1 / no_2
  end

  prompt("the result is: #{result}") 
  prompt("would you like to do another calculation? (if yes enter y)")
  ans = gets.chomp.downcase
    break unless ans.start_with?('y')    
end

prompt("Thank you for using the calculator programme, good bye.")


















