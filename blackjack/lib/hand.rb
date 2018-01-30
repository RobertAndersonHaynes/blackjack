require 'pry'
require_relative 'deck.rb'

class Hand
  attr_accessor :hand_array
  def initialize
    @hand_array = []

  end
end
hand = Hand.new
# binding.pry
