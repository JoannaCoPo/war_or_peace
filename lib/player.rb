class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    return true if @deck.cards == []
    false
  end

  def remove_card
    @deck.cards.shift
    # @deck.cards.pop
  end

end
