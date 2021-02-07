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
    if :basic #consfused about syntax here, check later
    #:basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
    player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    # return :basic

  elsif war?
    #:war turn occurs when both players’ rank_of_card_at(0) are the same.
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)

    else mutually_assured_destruction?
    #:mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
      player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
    end
  end

#  @top_card1 = player1.deck.remove_card
  #@top_card2 = player2.deck.remove_card
  def winner #issue here - check state of object
    if basic
    #:basic, it will return whichever player has a higher rank_of_card_at(0)
      player1.deck.rank_of_card_at(0) < 0 ? player1: player2

    elsif war
    #:war the winner will be whichever player has a higher rank_of_card_at(2)
      player1.deck.rank_of_card_at(2) < 0 ? player1 : player2

    else mutually_assured_destruction?
      #:mutually_assured_destruction the method will return No Winner.
      # @top_card1 = player1.deck.remove_card
      # @top_card2 = player2.deck.remove_card
    end
  end

  def pile_cards ##pile_cards: when this method is called, cards will be
  #sent from the players’ decks into the @spoils_of_war
  #based on these rules
    #for a :basic turn, each player will send one card
    #(the top card) to the spoils pile
    if basic? #:basc
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card

    elsif war?
    #for a :war turn, each player will send three cards (the top three cards)
    #to the spoils pile
      3.times {
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      }
    #:mutually_assured_destruction turn, each player will remove three
    #cards from play (the top three cards in their deck). These cards are not
    #sent to the spoils pile, they are simply removed from each players’ deck.
    else mutually_assured_destruction?
      3.times {
        player1.deck.remove_card
        player2.deck.remove_card
      }
    end
  end

end
