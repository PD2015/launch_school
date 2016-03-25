# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

require 'pry'

NUMBER_TO_PLAY_FOR = 21
DEALER_STICK_VALUE = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = [['H', 'A'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'] ] +
         [['D', 'A'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'] ] +
         [['S', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'] ] +
         [['C', 'A'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'] ]
 end

def initial_deal(deck, p_cards, c_cards)
   2.times do
    p_cards << deck.shuffle!.pop
    c_cards << deck.shuffle!.pop
  end
end

def deal_1_card(deck, player_ary)
  card = deck.shuffle!.pop
  player_ary << card
end

def card_total(player_ary)
  values = player_ary.map do |card|
    card[1]
  end 

  sum = 0 
  values.each do |value|
      if value == 'A'
        sum += 11
      elsif value.to_i == 0
        sum += 10
      else 
        sum += value.to_i
      end
  end

    if sum > NUMBER_TO_PLAY_FOR 
      values.select {|value| value == 'A'}.count.times do
        sum -= 10
      end
    end
  sum
end

def winner?(card_total, p_cards, c_cards)
  player_total = card_total(p_cards)
  dealer_total = card_total(c_cards)
  if player_total > dealer_total && player_total <= NUMBER_TO_PLAY_FOR
    "You Won!"
  elsif player_total < dealer_total && dealer_total <= NUMBER_TO_PLAY_FOR 
    "The dealer Won."
  elsif player_total < dealer_total && player_total <= NUMBER_TO_PLAY_FOR
    "You Won! The Dealer went bust."
  elsif player_total > NUMBER_TO_PLAY_FOR
    "Sorry, thats you bust. The dealer Wins"
  else player_total == dealer_total
    "It's a Draw!"
  end
end

def adding_to_scores(result_message, player_score, dealer_score)
  case result_message
  when "You've won" 
    player_score.replace([player_score[0] + 1])
  when "You Won! The Dealer went bust."
    player_score.replace([player_score[0] + 1])
  when "The dealer Won." 
    dealer_score.replace([dealer_score[0] + 1])
  when "Sorry, thats you bust. The dealer Wins"
     dealer_score.replace([dealer_score[0] + 1])
  when "It's a Draw!"
     player_score.replace([player_score[0] + 1]) 
    dealer_score.replace([dealer_score[0] + 1])
  end 
end

def joiner(player_ary, delimiter = ',', word = 'and')
  if player_ary.size > 1
    output = player_ary.map do |card|
      card[1]
    end
    output[-1] = "#{word} #{player_ary[-1][1]}"
  end
   output.join( delimiter)
end

# ******* END of Methods ***********

player_score = [0]
dealer_score = [0]
round = 1

loop do


  loop do
    p_cards =[]
    c_cards = []
    deck = initialize_deck
    initial_deal(deck, p_cards, c_cards)
   
    loop do
      system 'clear'
      player_total = card_total(p_cards)
      puts "Round #{round}: You've won: #{player_score[0]}, the dealer has won: #{dealer_score[0]}."
      puts "Dealer has: #{c_cards[0][1]} and unknown card"
      puts "You have: #{joiner(p_cards)}, thats a total of: #{player_total}"
      break if player_total > NUMBER_TO_PLAY_FOR
      prompt("Do you want to hit(h) or stay(s)?")
      player_decision = gets.chomp.downcase
      if player_decision == 's'  
        break
      else 
        deal_1_card(deck, p_cards)
      end
    end

    loop do
      #deal for computer
      dealer_total = card_total(c_cards)
      break if card_total(p_cards) > NUMBER_TO_PLAY_FOR || dealer_total >= DEALER_STICK_VALUE 
      deal_1_card(deck, c_cards)
    end
    # can't use the local variables player/dealer_total outside their loops. variables defined outside can be used within. Those defined within can't be used outside.
    # inefficient use of local variable player/dealer_total here but put in to remark on.
    system 'clear'
    result_message = p winner?(card_total(p_cards), p_cards, c_cards)
    adding_to_scores(result_message, player_score, dealer_score)
    puts "You had: #{joiner(p_cards)}, that totals: #{card_total(p_cards)}"
    puts "Dealer had: #{joiner(c_cards)}, that totals: #{card_total(c_cards)}"
    break
  end

  puts "Round #{round}: You've won: #{player_score[0]}, the dealer has won: #{dealer_score[0]}."
  prompt('Would you like to play again? (y/n)')
  ans = gets.chomp.downcase 
  break unless ans == 'y'
  round += 1

end

puts "Thanks for playing see you next time"




