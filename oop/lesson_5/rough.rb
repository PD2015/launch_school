# class Player

#   attr_reader :cards

#   def initialize(cards)
#     @cards = cards
#     @card_pack = [['H', 'Ace'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'Jack'], ['H', 'Queen'], ['H', 'King']] +
#                  [['D', 'Ace'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'Jack'], ['D', 'Queen'], ['D', 'King']] +
#                  [['S', 'Ace'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'Jack'], ['S', 'Queen'], ['S', 'King']] +
#                  [['C', 'Ace'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'Jack'], ['C', 'Queen'], ['C', 'King']] 

#   end

#   def shuffled_pack
#     @card_pack.shuffle
#   end

#   def pack
#     shuffled_pack
#   end
# end

# array = [1, 2, 3]
# jeff = Player.new(array)
# p jeff.cards
# p jeff.pack

cards = [['a', '1'], ['b', '2'],['c', '3']]

cards_total = cards.map {|card| card[1].to_i }.inject(:+)

    p cards_total