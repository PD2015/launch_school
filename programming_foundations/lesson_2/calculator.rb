
# ask for two numbers
# ask for the type of operation to perform: add, subtract, multiply or divide
# display the result

def prompt(message)
  puts "=> #{message}"
end

prompt("Please enter a number...")
no_1 = gets.chomp.to_f

prompt("Please enter a second number...")
no_2 = gets.chomp.to_f

prompt("What operation would you like to perform with these two numbers: add(+), subtract(-), multiply(*) or divide(/)?")
operation = gets.chomp.downcase

result = case operation
  when "+"
     no_1 + no_2
  when "-"
     no_1 - no_2
  when "*"
    no_1 * no_2  
  when "/"
    no_1 / no_2
  # when != "+" || "-" || "*" || "/"
  #   prompt("I'm afraid thats an invalid operation please imput either add, subtract, multiply or divide.")
end

puts result