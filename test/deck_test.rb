require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, 'King', 3)
    card3 = Card.new(:heard, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

def test_it_has_cards
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, 'King', 3)
  card3 = Card.new(:heard, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  assert_equal cards, deck.cards
end

def test_it_has_rank_at_0
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, 'King', 3)
  card3 = Card.new(:heard, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  assert_equal 12, deck.rank_of_card_at(0)
end

def test_it_has_rank_at_2
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, 'King', 3)
  card3 = Card.new(:heard, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  assert_equal 14, deck.rank_of_card_at(2)
end


def test_it_has_high_ranking_cards
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, 'King', 3)
  card3 = Card.new(:heard, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  assert_equal [card1, card3], deck.high_ranking_cards
end

def test_percent_of_high_ranking_cards
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, 'King', 3)
  card3 = Card.new(:heard, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  assert_equal 66.67, deck.percent_high_ranking
end

def test_it_can_remove_card
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, 'King', 3)
  card3 = Card.new(:heard, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  assert_equal card1, deck.remove_card
  assert_equal [card2, card3], deck.cards
end

end
