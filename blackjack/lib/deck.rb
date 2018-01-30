require 'pry'
require_relative 'card.rb'

SUITS = ['♠', '♥', '♦', '♣']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

class Deck
  attr_reader :array_of_cards
  attr_accessor :draw, :shuffle
  def initialize
    @array_of_cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @array_of_cards << Card.new(value, suit)
      end
    end
    @array_of_cards.shuffle!

    def draw!
      @array_of_cards.pop
    end

  end
end

deck = Deck.new
card = deck.draw!

# binding.pry
