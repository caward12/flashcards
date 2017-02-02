require_relative 'test_helper'
require_relative '../lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_has_a_file
    cg = CardGenerator.new('cards.txt')

    assert_equal 'cards.txt', cg.file
  end

  def test_collects_lines_from_file
    cg = CardGenerator.new('cards.txt')
    cg.collect_lines_from_file

    assert_equal 4, cg.file_lines.count
  end

  def test_it_creates_cards
    cg = CardGenerator.new('cards.txt')
    cg.collect_lines_from_file
    cg.new_cards

    assert_equal "What is 5 + 5?", cg.collect_cards[0].question
  end

  def test_it_collects_cards
    cg = CardGenerator.new('cards.txt')
    cg.collect_lines_from_file
    cg.new_cards

    assert_equal 4, cg.collect_cards.count

  end

  def test_it_creates_a_deck
    cg = CardGenerator.new('cards.txt')
    cg.collect_lines_from_file
    cg.new_cards
    cg.set_deck

    assert_instance_of Deck, cg.set_deck
  end

  def test_it_knows_whats_in_the_deck
    cg = CardGenerator.new('cards.txt')
    cg.collect_lines_from_file
    cg.new_cards
    cg.set_deck

    assert_equal "What is 5 + 5?", cg.set_deck.cards.first.question
  end
end
