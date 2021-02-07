class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def player1_turn
    player1
  end

  def player2_turn
    player2
  end

  def type
    if player1_turn.deck.rank_of_card_at(0) != player2_turn.deck.rank_of_card_at(0)
      :basic
    end
  end


  def winner #issue here - check state of object
    @top_card1 = player1.deck.remove_card
    @top_card2 = player2.deck.remove_card

    if @top_card1.rank > @top_card2.rank
      player1
    else
      player2
    end
  end

  def pile_cards
    #pile_cards: when this method is called, cards will be
    #sent from the players’ decks into the @spoils_of_war
    #based on these rules
    #for a :mutually_assured_destruction turn, each player will remove three
    #cards from play (the top three cards in their deck). These cards are not
    #sent to the spoils pile, they are simply removed from each players’ deck.
    if mutually_assured_destruction?
      3.times {
        player1.deck.remove_card
        player2.deck.remove_card
      }
    elsif war?
    #for a :war turn, each player will send three cards (the top three cards)
    #to the spoils pile
      3.times {
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      }
    #for a :basic turn, each player will send one card
    #(the top card) to the spoils pile
    else
    # @top_card1 = player1.deck.remove_card
    # top_card2 = player2_t.remove_card
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card

  end
end
end
