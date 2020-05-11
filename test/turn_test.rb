require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_can_read_players_attributes
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_it_starts_with_no_spoils
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_a_basic_type_of_turn
    assert_equal :basic, @turn.type
  end

  def test_it_has_a_basic_winner
    winner = @turn.winner
    assert_equal @player1, winner
  end

  def test_it_has_spoils_of_war
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_it_can_award_spoils_to_winner
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)

    assert_equal @deck1, @player1.deck
    assert_equal @deck2, @player2.deck
    assert_equal 5, @deck1.cards.count
    assert_equal 3, @deck2.cards.count
  end

  def test_it_has_war_type_of_turn
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end
end

# pry(main)> turn.type
# #=> :war
#
# pry(main)> winner = turn.winner
# #=> #<Player:0x007fc42aab6b70 @deck=#<Deck:0x007fc42a248678...>, @name="Aurora">
#
# pry(main)> turn.pile_cards
#
# pry(main)> turn.spoils_of_war
# #=> [#<Card:0x007fc42a170fe8...>, #<Card:0x007fc42a0f1b58...>, #<Card:0x007fc42a2149e0...>, #<Card:0x007fc42a205508...>, #<Card:0x007fc42aa85a98...>, #<Card:0x007fc42a1e4790...>]
#
# pry(main)> turn.award_spoils(winner)
#
# pry(main)> player1.deck
# #=> #<Deck:0x007fc42a05a258 @cards=[#<Card:0x007fc42a1580d8...>]>
#
# pry(main)> player2.deck
# #=> #<Deck:0x007fc42a248678 @cards=[#<Card:0x007fc42a1b4c98...>, #<Card:0x007fc42a170fe8...>, #<Card:0x007fc42a0f1b58...>, #<Card:0x007fc42a2149e0...>, #<Card:0x007fc42a205508...>, #<Card:0x007fc42aa85a98...>, #<Card:0x007fc42a1e4790...>]>
