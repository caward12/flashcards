require'pry'
require_relative "../lib/round"
require_relative "../lib/card"

class CardGenerator
 attr_reader :file, :file_lines, :collect_cards

  def initialize(file)
    @file = file
    @file_lines = []
    @collect_cards = []
  end

  def collect_lines_from_file
    f = File.new(file)
    @file_lines = f.readlines
    new_cards
  end

  def new_cards
    @file_lines.each do |line|
      question = line.split(",")[0]
      answer = line.split(",")[-1].chomp
      @collect_cards <<Card.new(question, answer)
    end
    set_deck
  end

  def set_deck
    Deck.new(@collect_cards)
  end
end

#binding.pry
""
