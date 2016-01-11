# Draw.io used for flowchart
require 'pry'
# Constants
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

# Methods
def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system "clear"
  puts "You are playing #{PLAYER_MARKER}, the computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_new_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_square(brd)
  brd.keys.select {|num| brd[num] == INITIAL_MARKER}
end

def player_select_tile!(brd)
  square = ''
  loop do
    prompt "Choose a tile (#{empty_square(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "That is not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_select_tile!(brd)
  computer = empty_square(brd).sample
  brd[computer] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_square(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  winning_lines.each do |lines|
    if brd[lines[0]] == PLAYER_MARKER &&
       brd[lines[1]] == PLAYER_MARKER &&
       brd[lines[2]] == PLAYER_MARKER
       return "Player"
    elsif brd[lines[0]] == COMPUTER_MARKER &&
       brd[lines[1]] == COMPUTER_MARKER &&
       brd[lines[2]] == COMPUTER_MARKER
       return "Computer"
    end
  end
  nil
end

loop do
  board = initialize_new_board

  loop do
    display_board(board)

    player_select_tile!(board)
    break if board_full?(board) || winner?(board)

    computer_select_tile!(board)
    break if board_full?(board) || winner?(board)
  end

  display_board(board)

  if winner?(board)
    prompt "#{detect_winner(board)} won!"
  else 
    prompt "Its a tie!"
  end

  prompt "Would you like to play again? (y or n)"
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end