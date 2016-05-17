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

  def deal_one
    cards.pop
  end
end
# ************************** M HAND ************************************
module Hand
  def values
    cards.map(&:value)
  end

  def display_cards
    joiner(values)
  end

  def total
    sum = 0
    values.each do |value|
      sum += if value == 'Ace'
               11
             elsif value.to_i == 0
               10
             else
               v = value.to_i
               v
             end
    end
    if sum > 21
      values.count { |value| value == 'Ace' }.times do
        sum -= 10
      end
    end
    sum
  end

  private

  def joiner(card_values, separator = ',', final_separator= '&')
    return card_values.join if card_values.size < 2
    comma_added_values = card_values.map do |num|
      num.to_s + separator unless num == card_values[-2, 2]
    end
    comma_added_values.pop
    comma_added_values[-1] = "#{card_values[-2]} #{final_separator} #{card_values.last}"
    comma_added_values.join(' ')
  end
end
# ************************** PARTICIPANT ************************************
class Participant
  include Hand
  attr_accessor :cards, :name
  def initialize(name)
    @cards = []
    @name = name
  end

  def hit?
    total < 17
  end

  def bust?
    total > 21
  end
end
# ************************** GAME ************************************
class Game
  attr_accessor :deck, :player, :dealer
  def initialize
    @deck = Deck.new
    @player = Participant.new('Player')
    @dealer = Participant.new('Dealer')
    deal_initial_2_cards
  end

  def clear
    system 'clear'
  end

  def deal_initial_2_cards
    2.times do
      player.cards << deck.deal_one
      dealer.cards << deck.deal_one
    end
  end

  def display_welcome_message
    puts "---- Welcome to Twenty One ----"
  end

  def display_participants_hands
    puts <<-OUTPUT
#{player.name} has #{player.display_cards}, total: #{player.total}.
#{dealer.name} has #{dealer.values[1]} & an unknown card.
OUTPUT
  end

  def player_turn
    answer = ''
    loop do
      answer = player_choice(answer)
      break if answer == 's'
      player.cards << deck.deal_one
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
      dealer.cards << deck.deal_one
      break if dealer.bust?
    end
  end

  def display_final_results
    puts <<-OUTPUT
#{player.name} has #{player.display_cards}, total: #{player.total}.
#{dealer.name} has #{dealer.display_cards}, total: #{dealer.total}.
OUTPUT
  end

  def display_winner
    p = player.total
    d = dealer.total
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
    display_participants_hands
    player_turn
    dealer_turn
    clear
    display_final_results
    display_winner
    display_goodbye_message
  end
end

Game.new
