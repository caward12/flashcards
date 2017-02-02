require_relative 'test_helper'
require_relative '../lib/guess'

class GuessTest < Minitest::Test
  def test_user_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Card, guess.card
  end

  def test_it_knows_the_question_on_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "What is the capital of Alaska?", guess.card.question
  end

  def test_it_knows_the_answer_on_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.card.answer 
  end

  def test_correct?
    card = Card.new("What is the capital of Texas?", "Austin")
    guess = Guess.new("Austin", card)
    assert guess.correct?
  end

  def test_not_correct?
    card = Card.new("What is the capital of Texas?", "Austin")
    guess = Guess.new("Waco", card)
    refute guess.correct?
  end

  def test_feedback_correct
    card = Card.new("What is the capital of Mississippi?", "Jackson")
    guess = Guess.new("Jackson", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_feedback_wrong
    card = Card.new("What is the capital of Alabama?", "Montgomery")
    guess = Guess.new("Birmingham", card)
    assert_equal "Incorrect!", guess.feedback
  end
end
