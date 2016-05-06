require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
# require 'minitest/reporters'
# MiniTest::Reporters.use!
require 'pry'

require_relative 'twenty_one2'
# ************************** CARD ************************************
class CardTest < MiniTest::Test
  def test_initialize
    c = Card.new('king')
    assert_equal('king', c.value) 
  end
end
# ************************** DECK ************************************
class DeckTest < MiniTest::Test
  attr_reader :deck
  def setup
    @deck = Deck.new
  end

  def test_initialize
    refute_empty(deck.cards)
    deck.cards.each { |card| assert_instance_of(Card, card) }
    assert_equal(56, deck.cards.size)
  end
end
# ************************** PARTICIPANT ************************************
class ParticipantTest <MiniTest::Test
  def setup
    @card_values = %w(Ace Jack Queen King ) + (1..10).to_a
    @p = Participant.new('Bob')
  end

  def test_initialize
    assert_equal('Bob', @p.name)
    assert_empty(@p.cards)
  end

  def test_values
    @p.cards<< Card.new('king')
    refute_empty(@p.values)
    assert_equal('king', @p.values[0])
  end

  def test_display_cards_1
    @p.cards << Card.new('King')
    assert_equal('King', @p.display_cards)
  end

  def test_dispaly_cards_2
    @p.cards << Card.new('King') << Card.new('Queen')
    assert_equal('King & Queen', @p.display_cards)
  end

  def test_display_cards_3
    @p.cards << Card.new('King') << Card.new('Queen') << Card.new('Jack')
    assert_equal('King, Queen & Jack', @p.display_cards)
  end

  def test_total
    assert_empty(@p.cards)  
    assert_equal(0, @p.total)
    @card_values.each do |value|
      @p.cards = [Card.new(value)]
      refute_empty(@p.cards)
      assert(@p.total > 0)
    end
    %w(King Queen Jack).each do |value|
      @p.cards = [Card.new(value)]
      assert_equal(10, @p.total)
    end
    @p.cards = [Card.new('Ace')]
    assert_equal(11, @p.total)
    @p.cards = [Card.new('Ace'), Card.new('10'), Card.new('10')]
    assert_equal(21, @p.total)
  end

  def test_hit_question
    (1..16).each do |value|
      @p.cards = [Card.new(value)]
      assert(@p.hit?)
    end
    @p.cards = [Card.new(18)] 
    assert_equal(false, @p.hit?)
  end

  def test_bust_question
    (1..17).each do |value|
      @p.cards = [Card.new(value)]
      assert_equal(false, @p.bust?)
    end
    @p.cards = [Card.new(22)] 
    assert(@p.bust?)
  end
end

# ************************** GAME ************************************
class Game
  # no tests appear to fail no matter what gets input....Essentially not being tested.
  def setup
    @game = Game.new
    @deck = Deck.new
    @player = Participant.new('Player')
    @dealer = Participant.new('Dealer') 
  end

  def test_initialize
    assert_equal('Player', @player.name)
    assert_equal('Dealer', @dealer.name)
    assert_equal([], @deck.cards)
    assert_instance_of(Deck, @game.deck)
    assert_instance_of(Participant, @game.player)
    assert_instance_of(Participant, @game.dealer)
  end

  def test_deal_initial_2_cards
    assert_equal(@player.hand.size == 2, @game.deal_initial_2_cards)
    assert_equal(@dealer.hand.size == 2, @game.deal_initial_2_cards)
  end

  def test_deal
    assert_instance_of(Card, @game.deal)
  end

  def test_display_messages_have_output
    assert_instance_of(String, @game.display_welcome_message)
    assert_instance_of(String, @game.display_participants_hands)
    assert_instance_of(String, @game.display_final_results)
    assert_instance_of(String, @game.display_winner)
    assert_instance_of(String, @game.display_goodbye_message)
  end

  def test_display_welcome_message
    assert_equal(nil, @game.display_welcome_message)
    assert_output("---- Welcome to Twenty One ----", @game.display_welcome_message)
  end

  def test_display_winner
    @player.total = 22
    assert_output("Sorry, thats you bust. The dealer Wins that round", @game.display_winner)
  end

end
