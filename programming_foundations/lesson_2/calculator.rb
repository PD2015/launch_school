
# ask for two numbers
# ask for the type of operation to perform: add, subtract, multiply or divide
# display the result
require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_f != 0.0
end

def operation_to_message(op)
  case op
  when "+"
    "Adding"
  when "-"
    "Subtracting"
  when "*"
    "Multiplying"
  when "/"
    "Dividing"
  end
end

prompt(MESSAGES["welcome"])

name = ''
loop do
  name = gets.chomp.downcase
  if name.empty?
    prompt(MESSAGES["valid_name_error"])
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
      prompt(MESSAGES["valid_number_error"])
    end
  end

  loop do # number 2 loop
    prompt(MESSAGES["enter_second_no"])
    no_2 = gets.chomp.to_f
    if valid_number?(no_2)
      break
    else
      prompt(MESSAGES["valid_number_error"]) 
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
      prompt(MESSAGES["valid_operation_error"])
    end
  end

  prompt("#{operation_to_message(operation)} the 2 numbers")

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
  prompt(MESSAGES["repeat"])
  ans = gets.chomp.downcase
  break unless ans.start_with?('y')
end

prompt(MESSAGES["good_bye"])
