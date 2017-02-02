require_relative 'test_helper'
require_relative '../lib/round'

class RoundTest < Minitest::Test
  def test_it_has_a_deck
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_it_has_no_guesses
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_knows_current_card
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_instance_of Card, round.current_card
    assert_equal card_1.question, round.current_card.question
  end

  def test_it_can_record_guess
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Dallas")
    round.record_guess("Dallas")
    round.record_guess("Dallas")

    assert_equal 3, round.guesses.count
  end

  # def test_it_knows_one_guess
  #   card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
  #   card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
  #   card_3 = Card.new("What is the capital of Texas?", "Austin")
  #   deck = Deck.new([card_1, card_2, card_3])
  #   round = Round.new(deck)
  #   round.record_guess("Montgomery")
  #
  #   assert_equal 1, round.guesses.count
  # end

  def test_it_knows_more_than_one_guess
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Birmingham")
    round.record_guess("Montgomery")

    assert_equal "Birmingham", round.guesses.first.response
    assert_equal "Montgomery", round.guesses.last.response
  end

  def test_it_can_give_feedback
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Montgomery")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_knows_wrong_guess
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Birmingham")

    assert_equal "Incorrect!", round.guesses.first.feedback
  end

  def test_it_knows_one_correct_guess
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Montgomery")
    round.record_guess("Denver")

    assert_equal 1, round.number_correct
  end

  def test_it_knows_current_card_after_one
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Montgomery")

    assert_equal card_2, round.current_card
  end

  def test_it_knows_percent_correct
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Montgomery")
    round.record_guess("St. Louis")

    assert_equal 50, round.percent_correct
  end

  def test_it_can_start_round
    card_1 = Card.new("What is the capital of Alabama?", "Montgomery")
    card_2 = Card.new("What is the capital of Mississippi?", "Jackson")
    card_3 = Card.new("What is the capital of Texas?", "Austin")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)



  end


end
