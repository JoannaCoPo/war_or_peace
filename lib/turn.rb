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
    @player1
  end

  def player2_turn
    @player2
  end

  def type
    #:basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
    basic_check = player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    #:war turn occurs when both players’ rank_of_card_at(0) are the same.
    war_check = player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    #:mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    mad_check = player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)

    if basic_check
      :basic
    elsif war_check
      :war
    else war_check && mad_check
      :mutually_assured_destruction
    end
  end

  def winner #issue here - check state of object
    #:basic, it will return whichever player has a higher rank_of_card_at(0)
    if type == :basic
      player1_wins = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      if player1_wins
        player1
      else
        player2
      end
    elsif type == :war
    #:war the winner will be whichever player has a higher rank_of_card_at(2)
      player1_wins = player1.deck.rank_of_card_at(2) > player.deck.rank_of_card_at(2)
      if player1_wins
        player1
      else
        player2
      end
    else type == :mutually_assured_destruction
      #:mutually_assured_destruction the method will return No Winner.
      'No Winner'
    end
  end

  def pile_cards
    #for a :basic turn, each player will send one card
    #(the top card) to the spoils pile
    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card

    elsif type == :war
    #for a :war turn, each player will send three cards (the top three cards)
    #to the spoils pile
      3.times do
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    #:mutually_assured_destruction turn, each player will remove three
    #cards from play (the top three cards in their deck). These cards are not
    #sent to the spoils pile, they are simply removed from each players’ deck.
  elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war)
  end

end
