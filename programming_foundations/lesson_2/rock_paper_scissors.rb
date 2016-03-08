# lizard/spock
#  win
# scissors => paper||lizard
# paper    => rock||spock
# rock     => scissors||lizard
# lizard   => paper||spock
# spock    => scissors||rock

# loose - one stage out.
# scissors => rock||spock
# paper    => scissors||lizard
# rock     => paper||spock
# lizard   => scissors||rock
# spock    => paper||lizard



VALID_CHOICE = {rock: "r", paper: "p", scissors: "s"}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player_choice, computer_choice)
  if win?(VALID_CHOICE.key(player_choice).to_s, computer_choice)
    prompt("You Win :) ")
  elsif win?(computer_choice, VALID_CHOICE.key(player_choice).to_s)
    prompt("you loose :(")
  else
    prompt("You draw :|")
  end
end

loop do
  player_choice = ''
  prompt("Please make a choice between: #{VALID_CHOICE.keys.join(', ')}")

  loop do
    player_choice = gets.chomp
    if VALID_CHOICE.has_value?(player_choice)
      break
    else
      prompt("Sorry thats not available. Please choose either rock, paper or scissors")
    end
  end

  computer_choice = VALID_CHOICE.keys.sample

  prompt("the computer chose #{computer_choice}")

  display_results(player_choice, computer_choice)

  prompt("would you like to play again? (if yes type y)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing, catch you later :)")
