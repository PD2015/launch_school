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

require 'pry'

VALID_CHOICE = { rock: "r", paper: "p", scissors: "s" }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == :rock && second == :scissors) ||
    (first == :paper && second == :rock) ||
    (first == :scissors && second == :paper)
end

def display_results(player_choice, computer_choice)
  if win?(VALID_CHOICE.key(player_choice), computer_choice)
    p "You Win :)"
  elsif win?(computer_choice, VALID_CHOICE.key(player_choice))
    p "You Loose :("
  else
    p "You Draw :|"
  end
end

player_score = 0
computer_score = 0
round = 1

loop do
  puts "Round #{round}, player: #{player_score}, computer: #{computer_score} "
  player_choice = ''
  prompt("Please make a choice between: Rock(r), Paper(p), Scissors(s)")
  # logic could be ....#{VALID_CHOICE.each { |key, value| puts "- #{key.to_s}(#{value})"}
  loop do
    player_choice = gets.chomp.downcase
    if VALID_CHOICE.value?(player_choice)
      break
    else
      prompt("Sorry thats not available. Please choose either rock, paper or scissors")
    end
  end

  computer_choice = VALID_CHOICE.keys.sample

  prompt("the computer chose #{computer_choice}")

  result = display_results(player_choice, computer_choice)
  # how can this be extracted into a method and still add up? Can it?
  case result
  when "You Win :)"
    player_score += 1
  when "You Loose :("
    computer_score += 1
  when "You Draw :|"
    player_score += 1
    computer_score += 1
  end
  round += 1

  break if player_score == 5 || computer_score == 5

  prompt("would you like to play again? (if yes type y)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

if player_score == 5
  prompt("Well done you won the game!!")
elsif computer_score == 5
  prompt("Sorry the computers won the game!!")
end

prompt("Thanks for playing, catch you later :)")
