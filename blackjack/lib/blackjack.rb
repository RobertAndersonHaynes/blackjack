require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

puts "Welcome to Blackjack!"
puts "\n"
player = Hand.new
computer = Hand.new

deck = Deck.new
  2.times do |i|
    i = player.hand_array.push(deck.draw!) && computer.hand_array.push(deck.draw!)
  end


player.hand_array.each do |card|
  puts "Player was dealt #{card.rank}#{card.suit}"
end

player_score = 0
player.hand_array.each do |card|
  if card.face_card?
    player_score += 10
  elsif card.ace?
    player_score += 11
  else
    player_score += card.rank.to_i
  end
end

puts "Player score: #{player_score}"

puts "\n"

input = "h"
while player_score < 21 && input != "s"
  print "Hit or stand (H/S): "
  input = gets.chomp.downcase
  puts "\n"
  if input == "s"
    puts "Player score: #{player_score}\n\n"
  elsif input == "h"
    player.hand_array.push(deck.draw!)
    puts "Player was dealt #{player.hand_array.last.rank}#{player.hand_array.last.suit}"
    if player.hand_array.last.face_card?
      player_score += 10
    elsif player.hand_array.last.ace?
      player_score += 11
    else
      player_score += player.hand_array.last.rank.to_i
    end
    puts "Player score: #{player_score}\n\n"
    # binding.pry
  else
    puts "Invalid input."
  end
end

if player_score > 21
  puts "\nBust!  You lose..."
  end

if player_score <= 21
  computer.hand_array.each do |card|
    puts "Dealer was dealt #{card.rank}#{card.suit}"
  end
  dealer_score = 0
  computer.hand_array.each do |card|
    if card.face_card?
      dealer_score += 10
    elsif card.ace?
      dealer_score += 11
    else
      dealer_score += card.rank.to_i
    end
  end
  puts "Dealer score: #{dealer_score}\n\n"
  while dealer_score <= 17
    computer.hand_array.push(deck.draw!)
    puts "Dealer was dealt #{computer.hand_array.last.rank}#{computer.hand_array.last.suit}"
    if computer.hand_array.last.face_card?
      dealer_score += 10
    elsif computer.hand_array.last.ace?
      dealer_score += 11
    else
      dealer_score += computer.hand_array.last.rank.to_i
    end
    puts "Dealer score: #{dealer_score}\n\n"
  end
end

if dealer_score > 21
  puts "Dealer busts!  You win!"
elsif 17 < dealer_score
  puts "Dealer Stands\n\n"
  if dealer_score > player_score
    puts "Dealer wins!"
  elsif player_score > dealer_score
    puts "You win!"
  else
    puts "It's a tie!"
  end   
end










# for each card check to see if @rank is a face card then value is 10, else if @rank is ace, value is 11 else @rank = rank
