require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @deck = Deck.new([@card1, @card2, @card3])

    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end
end




# pry(main)> player.deck
# #=> #<Deck:0x007f9cc396bdf8 @cards=[#<Card:0x007f9cc3a73a98...>, #<Card:0x007f9cc3a03720...>, #<Card:0x007f9cc3a44c98...>]>
#
# pry(main)> player.has_lost?
# #=> false
#
# pry(main)> player.deck.remove_card
# #=> #<Card:0x007f9cc3a73a98 @rank=12, @suit=:diamond, @value="Queen">
#
# pry(main)> player.has_lost?
# #=> false
#
# pry(main)> player.deck.remove_card
# #=> #<Card:0x007f9cc3a03720 @rank=3, @suit=:spade, @value="3">
#
# pry(main)> player.has_lost?
# #=> false
#
# pry(main)> player.deck.remove_card
# #=> #<Card:0x007f9cc3a44c98 @rank=14, @suit=:heart, @value="Ace">
#
# pry(main)> player.has_lost?
# #=> true
#
# pry(main)> player.deck
# #=> #<Deck:0x007f9cc396bdf8 @cards=[]>
