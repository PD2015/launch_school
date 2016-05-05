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
   values = hand.map do |card|
      card.value
    end
    values
  end

  def joiner(card_values, separator = ',', final_separator= '&')
    if card_values.size < 2
      return card_values.join
    else
      joiner_card_values = card_values.map do |num|
        unless num == card_values[-2, 2]
        num.to_s + separator
        end
      end
      joiner_card_values.pop
      joiner_card_values[-1]= "#{card_values[-2]} #{final_separator} #{card_values.last}"
      return joiner_card_values.join(' ')
    end
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

  def display_hit_or_stick_message
    answer = ''
    loop do 
      loop do
        puts "Would you like to hit(h) or stick(s)?"
        answer = gets.chomp.downcase
        break if ['h', 's'].include?(answer)
        puts "Sorry thats not a valid choice"
      end
      break if answer == 's'    
      player.hand << deal
      clear
      display_participants_hands
      break if player.bust?
    end
    
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
    if player.hand_total > dealer.hand_total && player.hand_total <= 21
      puts "You've Won that round!"
    elsif player.hand_total < dealer.hand_total && dealer.hand_total <= 21
      puts "The Dealer Won that round."
    elsif player.hand_total < dealer.hand_total && player.hand_total <= 21
      puts "You've Won that round! The Dealer went bust."
    elsif player.hand_total > 21
      puts "Sorry, thats you bust. The dealer Wins that round"
    elsif player.hand_total == dealer.hand_total
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
    display_hit_or_stick_message
    clear
    display_final_results
    display_winner
    display_goodbye_message   
  end  
end

Game.new.start
