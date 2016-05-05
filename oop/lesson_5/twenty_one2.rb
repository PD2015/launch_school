# ************************** CARD ************************************
class Card
  attr_reader :value
  def initialize(value)
    @value = value
  end
end
# ************************** DECK ************************************
class Deck
  CARD_VALUES = (%w(Ace Jack Queen King ) + (1..10).to_a) * 4
  attr_reader :cards
  def initialize
    @cards = []
    set_new_deck
  end

  def set_new_deck
    CARD_VALUES.each { |value| cards << Card.new(value) }
    cards.shuffle!
  end 
end

# ************************** PARTICIPANT ************************************
class Participant
  attr_accessor :hand, :name
  def initialize(name)
    @hand = []
    @name = name
  end

  def hand_values
    hand.map { |card| card.value }
  end

  def display_hand(param = hand_values)
    joiner(hand_values)
  end

  def hand_total(param = hand_values)
    sum = 0
    hand_values.each do |value|
      if value == 'Ace'
        sum += 11
      elsif value.to_i == 0
        sum += 10
      else
        sum += value.to_i
      end
    end
    if sum > 21
      hand_values.count { |value| value == 'Ace' }.times do
        sum -= 10
      end
    end
    sum
  end

# for dealer
  def hit?
    hand_total < 17
  end

  def bust?
    hand_total > 21
  end

  private
  # module?
   def joiner(card_values, separator = ',', final_separator= '&')
    return card_values.join if card_values.size < 2
    comma_added_values = card_values.map do |num|
      num.to_s + separator unless num == card_values[-2, 2]
    end
    comma_added_values.pop
    comma_added_values[-1]= "#{card_values[-2]} #{final_separator} #{card_values.last}"
    comma_added_values.join(' ')
  end

end
# ************************** GAME ************************************
class Game
  attr_accessor :deck, :player, :dealer
  def initialize
    @deck = Deck.new
    @player = Participant.new('Player')
    @dealer = Participant.new('Dealer')
  end

  def clear
    system 'clear'
  end

  def deal_initial_2_cards
    2.times do
      player.hand << deal
      dealer.hand << deal
    end
  end

  def deal
    deck.cards.pop
  end

  def display_welcome_message
    puts "---- Welcome to Twenty One ----"
  end

  def display_participants_hands
    puts <<-OUTPUT 
#{player.name} has #{player.display_hand}, total: #{player.hand_total}.
#{dealer.name} has #{dealer.hand_values[1]} & an unknown card.
OUTPUT
  end

  def player_turn
    answer = ''
    loop do 
      answer = player_choice(answer)
      break if answer == 's'    
      player.hand << deal
      clear
      display_participants_hands
      break if player.bust?
    end
  end

  def player_choice(answer)
    loop do
      puts "Would you like to hit(h) or stick(s)?"
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry thats not a valid choice"
    end
    answer
  end

  def dealer_turn
    loop do 
      break if dealer.hit? == false
      dealer.hand << deal
      break if dealer.bust?
    end
  end

  def display_final_results
    puts <<-OUTPUT 
#{player.name} has #{player.display_hand}, total: #{player.hand_total}.
#{dealer.name} has #{dealer.display_hand}, total: #{dealer.hand_total}.
OUTPUT
  end

  def display_winner
    p = player.hand_total
    d = dealer.hand_total
    if p > d && p <= 21
      puts "You've Won that round!"
    elsif p < d && d <= 21
      puts "The Dealer Won that round."
    elsif p < d && p <= 21
      puts "You've Won that round! The Dealer went bust."
    elsif p > 21
      puts "Sorry, thats you bust. The dealer Wins that round"
    elsif p == d
      puts "That round is a draw!"
    end  
  end

  def display_goodbye_message
    puts "Thanks for playing, catch you later."
  end

  def start
    clear
    display_welcome_message
    deal_initial_2_cards
    display_participants_hands
    player_turn
    dealer_turn
    clear
    display_final_results
    display_winner
    display_goodbye_message   
  end  
end

# Game.new.start
