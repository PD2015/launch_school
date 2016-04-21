
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
  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  
end
# ************************** DEALER ************************************
class Dealer 
  include Hand
  def initialize
    # seems like very similar to Player... do we even need this?
  end
end
# ************************** Deck ************************************
class Deck
  attr_accessor :card_pack
  def initialize
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
    @card_pack = [['H', 'Ace'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'Jack'], ['H', 'Queen'], ['H', 'King']] +
                 [['D', 'Ace'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'Jack'], ['D', 'Queen'], ['D', 'King']] +
                 [['S', 'Ace'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'Jack'], ['S', 'Queen'], ['S', 'King']] +
                 [['C', 'Ace'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'Jack'], ['C', 'Queen'], ['C', 'King']] 
  end

  def deal
    # does the dealer or the deck deal?
  end
end
# ************************** CARD ************************************
class Card
  def initialize
    # what are the "states" of a card?
  end
end
# ************************** GAME ************************************
class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start