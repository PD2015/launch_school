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

NUMBER_TO_PLAY_FOR = 21

cards = [1, 2, 4, 'king', 'queen', 'Ace']
sum = 0
cards_total = cards.each do |card| 

  if card == 'Ace'
    sum += 11
  elsif card.to_i == 0
    sum += 10
  elsif  
    sum += card.to_i  
  end

end

if sum > NUMBER_TO_PLAY_FOR
    values.count { |value| value == 'Ace' }.times do
      sum -= 10
    end
  end

  p sum

    p cards_total

















