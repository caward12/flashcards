require 'pry'
require_relative './card'
require_relative './guess'
require_relative './deck'
require_relative './card_generator'

class Round
  attr_reader :deck, :guesses, :current_card, :correct_count

  def initialize(deck)
    @deck = deck
    @guesses = []
    @correct_count = 0
  end

  def current_card
    @current_card = @deck.cards[@guesses.count]
  end

  def record_guess(guess)
    current_guess = Guess.new(guess, current_card)
    @guesses << (current_guess)
    # current_guess
  end

  def number_correct
    number_correct = @guesses.find_all do |guess|
    guess.correct?
    end
    number_correct.count
  end

  def percent_correct
    ((number_correct.to_f/guesses.count)*100).to_i
  end

  def start


    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    deck.cards.each do |card|
      puts "This is card number #{guesses.count+1} of #{deck.count}."
      puts "Question: #{current_card.question}"
      user_response = gets.chomp.downcase
      record_guess(user_response)

      puts "#{guesses.last.feedback}"
    end

    puts "******** Game Over! ********"

    puts "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%"

  end
end
#binding.pry
""
