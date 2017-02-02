require_relative 'test_helper'
require_relative '../lib/deck'

class DeckTest < Minitest::Test
  def test_it_has_deck_of_cards
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_it_counts_cards
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
    refute_equal 2, deck.count
  end

  def test_it_knows_question_on_card
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal "What is the capital of Alabama?", deck.cards[0].question
  end

  def test_it_knows_answer_on_card
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal "Jackson", deck.cards[1].answer
  end
end
