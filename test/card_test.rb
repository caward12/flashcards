require_relative 'test_helper'
require_relative '../lib/card'

class CardTest < Minitest::Test
  def test_it_has_a_question
    card = Card.new("What is the capital of Missouri?", "Jefferson City")
    assert_equal "What is the capital of Missouri?", card.question
  end

  def test_it_has_an_answer
    card = Card.new("What is the capital of Illinois?", "Springfield")
    assert_equal "Springfield", card.answer
  end

end
