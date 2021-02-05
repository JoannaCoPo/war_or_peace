class Deck
  attr_reader :cards
# ^^only for IV's

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    single_card = @cards[index] #generic
    single_card.rank
  end

  def high_ranking_cards # return an array of cards in the deck that have a rank of 11+
    high_cards = @cards
    high_cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    high_cards = @cards.find_all do |card|
      card.rank >= 11
    end
    percent = high_cards.count.to_f / @cards.count.to_f
    percent.round(4) * 100
  end

  def remove_card
    cards_in_deck = @cards
    cards_in_deck.shift
  end
end
