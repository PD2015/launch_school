
VALID_CHOICE = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt("You Win :) ")
  elsif win?(computer_choice, player_choice)
    prompt("you loose :(")
  else
    prompt("You draw :|")
  end
end

loop do
  player_choice = ''
  prompt("Please make a choice between: #{VALID_CHOICE.join(', ')}")

  loop do
    player_choice = gets.chomp
    if VALID_CHOICE.include?(player_choice)
      break
    else
      prompt("Sorry thats not available. Please choose either rock, paper or scissors")
    end
  end

  computer_choice = VALID_CHOICE.sample

  prompt("the computer chose #{computer_choice}")

  display_results(player_choice, computer_choice)

  prompt("would you like to play again? (if yes type y)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing, catch you later :)")
