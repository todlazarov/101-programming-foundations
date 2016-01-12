# Constants
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

# Methods
def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system "clear"
  puts "You are #{PLAYER_MARKER}, the computer is #{COMPUTER_MARKER}"
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

def initialize_game
  board = {}
  (1..9).each { |num| board[num] = INITIAL_MARKER }
  board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_turn(brd)
  choice = ''
  loop do
    prompt "Pick a square (#{empty_squares(brd).join(', ')}):"
    choice = gets.chomp.to_i
    break if empty_squares(brd).include?(choice)
    prompt "This is not a valid choice."
  end

  brd[choice] = PLAYER_MARKER
end

def computer_turn(brd)
  comp_choice = empty_squares(brd).sample
  brd[comp_choice] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def who_wins?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def winner?(brd)
  !!who_wins?(brd)
end

# Main logic
loop do
  board = initialize_game

  loop do
    display_board(board)

    player_turn(board)
    break if winner?(board) || board_full?(board)
    computer_turn(board)

    break if winner?(board) || board_full?(board)
    display_board(board)
  end

  display_board(board)

  if winner?(board)
    prompt "#{who_wins?(board)} wins!"
  else
    prompt "Its a tie!"
  end

  prompt "Would you like to play again?(y or n)"
  repeat = gets.chomp
  break unless repeat.downcase.start_with?('y')
end

prompt "Thank you for playing TicTacToe! Goodbye!"