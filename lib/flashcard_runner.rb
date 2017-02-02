require 'pry'
require_relative './card'
require_relative './guess'
require_relative './deck'
require_relative './round'
require_relative './card_generator'


file = ('cards.txt')
deck = CardGenerator.new(file).collect_lines_from_file
round = Round.new(deck)

round.start
