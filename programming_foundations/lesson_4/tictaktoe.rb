require 'pry'

INITIAL_MARKER = ' '
PLAYER_PIECE = 'X'
COMPUTER_PIECE = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # lines
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonols

def prompt(msg)
  puts " => #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts " You're #{PLAYER_PIECE} and the computer is #{COMPUTER_PIECE}"
  puts "            "
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
  puts "            "
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# == IMPORTANT. NOT SETTING ASKING IF ITS EQUAL.
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Please select a square #{empty_squares(brd).join(', ')}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt('Sorry thats not a valid choice')
  end
  brd[square] = PLAYER_PIECE
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_PIECE
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_PIECE &&
    #    brd[line[1]] == PLAYER_PIECE &&
    #    brd[line[2]] == PLAYER_PIECE
    # or
    # brd.values_at(line[0], line[1], line[2]).count(PLAYER_PIECE) == 3
    # or
    if brd.values_at(*line).count(PLAYER_PIECE) == 3
      return "player"
    elsif brd.values_at(*line).count(COMPUTER_PIECE) == 3
      return "computer"
    end
  end
  nil
end

loop do # main game loop
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie")
  end

  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt('Thanks for playing see you next time')
