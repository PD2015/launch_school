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
    assert_empty(@p.hand)
    # test that upon creation hand is empty or has 2 cards in it?
  end

  def test_hand_values
    @p.hand << Card.new('king')
    refute_empty(@p.hand_values)
    assert_equal('king', @p.hand_values[0])
  end

  # def test_joiner
  #   assert_instance_of(String, joiner(['king']))
  # end

  def test_dispaly_hand_1
    @p.hand << Card.new('King')
    assert_equal('King', @p.display_hand)
  end

  def test_dispaly_hand_2
    @p.hand << Card.new('King') << Card.new('Queen')
    assert_equal('King & Queen', @p.display_hand)
  end

  def test_display_hand_3
    @p.hand << Card.new('King') << Card.new('Queen') << Card.new('Jack')
    assert_equal('King, Queen & Jack', @p.display_hand)
  end

  def test_hand_total
    assert_empty(@p.hand)  
    assert_equal(0, @p.hand_total)
    @card_values.each do |value|
      @p.hand = [Card.new(value)]
      refute_empty(@p.hand)
      assert(@p.hand_total > 0)
    end
    %w(King Queen Jack).each do |value|
      @p.hand = [Card.new(value)]
      assert_equal(10, @p.hand_total)
    end
    @p.hand = [Card.new('Ace')]
    assert_equal(11, @p.hand_total)
    @p.hand = [Card.new('Ace'), Card.new('10'), Card.new('10')]
    assert_equal(21, @p.hand_total)
  end

  def test_hit_question
    (1..16).each do |value|
      @p.hand = [Card.new(value)]
      assert(@p.hit?)
    end
    @p.hand = [Card.new(18)] 
    assert_equal(false, @p.hit?)
  end

  def test_bust_question
    (1..17).each do |value|
      @p.hand = [Card.new(value)]
      assert_equal(false, @p.bust?)
    end
    @p.hand = [Card.new(22)] 
    assert(@p.bust?)
  end
end

# ************************** GAME ************************************
class Game

  def setup
    @deck = Deck.new
    @player = Participant.new('Player')
    @dealer = Participant.new('Dealer') 
  end

  def test_initialize
    @game = Game.new
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
    assert_equal("---- Welcome to Twenty One ----", @game.display_welcome_message)
  end

end
