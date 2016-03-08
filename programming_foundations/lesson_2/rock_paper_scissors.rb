
VALID_CHOICE = %w("rock", "paper", "scissors")

def prompt(message)
  puts "=> #{message}"
end

def display_results(player_choice, computer_choice)
  if (player_choice == "rock" && computer_choice == "scissors") ||
     (player_choice == "paper" && computer_choice == "rock") ||
     (player_choice == "scissors" && computer_choice == "paper")
    prompt("You Win :) ")
  elsif (player_choice == "paper" && computer_choice == "scissors") ||
    (player_choice == "scissors" && computer_choice == "rock") ||
    (player_choice == "rock" && computer_choice == "paper")
    prompt("you loose :(")
  else (player_choice == "paper" && computer_choice == "paper") ||
    (player_choice == "rock" && computer_choice == "rock") ||
    (player_choice == "scissors" && computer_choice == "scissors")
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
  break unless answer = gets.chomp.downcase.start_with?('y')
end

prompt("Thanks for playing, catch you later :)")
