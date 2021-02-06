class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def player1_t
    player1
  end

  def player2_t
    player2
  end

  def type
    if player1_t.deck.rank_of_card_at(0) != player2_t.deck.rank_of_card_at(0)
      :basic
    end
  end


  def turn_winner
    card1 = player1_t.remove_card
    card2 = player2_t.remove_card
    # binding.pry
    if card1.rank > card2.rank
      player1
    else
      player2
    end
  end
end
