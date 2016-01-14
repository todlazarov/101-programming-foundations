require 'pry'
# Constants
SUITS = ["S", "H", "D", "C"]
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

# Methods
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_results(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_results(player_cards, dealer_cards)
  result = detect_results(player_cards, dealer_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-----------------"
  prompt "Would you like to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# Main logic
loop do
  system "clear"
  prompt "Welcome to our game of Twenty-One!"

  # Initialize game
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # Draw cards
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "The dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]} for a total of #{total(player_cards)}."

  # Player's turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, you have to pick 'h' or 's'."
    end

    if player_turn == 'h'
      prompt "You chose to hit!"
      player_cards << deck.pop
      prompt "Your cards are now; #{player_cards}"
      prompt "Your total is #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_results(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}."
  end

  # Dealer's turn
  prompt "Dealer's turn"
  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "The Dealer's total is now: #{total(dealer_cards)}"
    display_results(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  # Both player and dealer stay, compare cards
  puts "==================="
  prompt "The dealer has #{dealer_cards} for a total of #{total(dealer_cards)}"
  prompt "The player has #{player_cards} for a total of #{total(player_cards)}"
  puts "==================="

  display_results(player_cards, dealer_cards)

  break unless play_again?
end

prompt "Thank you playing Twenty-One! Good bye!"