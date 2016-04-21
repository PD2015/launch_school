
# ************************** HAND ************************************
module Hand
  # what goes in here? all the redundant behaviors from Player and Dealer?

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

# ************************** PLAYER ************************************
class Player 
  include Hand

  attr_accessor :cards
  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
    @cards = []
  end

  def joiner(card_values, separator = ',', final_separator= 'and')
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

  def display_cards
    card_values = @cards.map do |card|
      card[1]
    end
    joiner(card_values)
  end

  def cards_total
    @cards.map {|card| card[1].to_i }.inject(:+)
  end

  
end
# ************************** DEALER ************************************
# class Dealer 
#   include Hand
#   def initialize(cards)
#     # seems like very similar to Player... do we even need this?
#   end
# end
# ************************** Deck ************************************
class Deck
  attr_accessor :card_pack
  def initialize
    @card_pack = [['H', 'Ace'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'Jack'], ['H', 'Queen'], ['H', 'King']] +
                 [['D', 'Ace'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'Jack'], ['D', 'Queen'], ['D', 'King']] +
                 [['S', 'Ace'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'Jack'], ['S', 'Queen'], ['S', 'King']] +
                 [['C', 'Ace'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'Jack'], ['C', 'Queen'], ['C', 'King']] 
  end

  def shuffled_pack
    @card_pack.shuffle
  end

  def deal_1
    shuffled_pack.pop
  end
end
# ************************** CARD ************************************
# class Card
#   def initialize
#     # what are the "states" of a card?
#   end
# end
# ************************** GAME ************************************
class Game

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Player.new
  end

  def display_welcome_message
    puts "Welcome to Twenty One"
  end

  def deal_initial_cards
    2.times do
    player.cards << deck.deal_1
    dealer.cards << deck.deal_1
    end
  end

  def display_players_cards
    puts "The player has #{player.display_cards} (total: #{player.cards_total} ), the Dealer has #{dealer.display_cards}, (total: #{dealer.cards_total})."
  end

  def display_goodbye_message
    puts "Thanks for playing, catch you later."
  end

               # ************* GAME-LOOP **********
  def start
    display_welcome_message
    deal_initial_cards
    display_players_cards
    # player_turn
    # dealer_turn
    # show_result
    display_goodbye_message
  end
              # ************* GAME-LOOP **********
end

Game.new.start