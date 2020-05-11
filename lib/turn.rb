class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2  = player2
    @spoils_of_war = []
  end

  def type
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    :basic
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil_card|
      winner.deck.add_card(spoil_card)
    end
    @spoils_of_war.clear
  end
end
