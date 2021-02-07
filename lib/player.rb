class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @player.deck.cards == []
  end

  def remove_card
    @deck.cards.shift
    # @deck.cards.pop
  end

end
