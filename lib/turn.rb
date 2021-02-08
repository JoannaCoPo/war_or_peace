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
    basic_check = player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
    war_check = player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
    mad_check = player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)

    if basic_check
      :basic
    elsif war_check
      :war
    else war_check && mad_check
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      player1_wins = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      if player1_wins
        player1
      else
        player2
      end
    elsif type == :war
      player1_wins = player1.deck.rank_of_card_at(2) > player.deck.rank_of_card_at(2)
      if player1_wins
        player1
      else
        player2
      end
    else type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards

    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card

    elsif type == :war
      3.times do
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end

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
