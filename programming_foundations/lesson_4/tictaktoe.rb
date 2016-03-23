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
def display_board(brd, player_score, computer_score, round)
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
  # puts "Player #{score_hash[:player]}, Computer #{ score_hash[:computer]}"
  puts "Round #{round}. The first to 5 wins the game!" unless player_score == 5 || computer_score == 5
  puts "Player has #{player_score}, Computer has #{computer_score}"
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
  square = nil
  # square = detect_immediate_threat(brd)  
  binding.pry
  if detect_immediate_threat(brd) == nil
# detect an immediate threat is not returning nil at anypoint for somereson.
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_PIECE
  end
  
end

def detect_immediate_threat(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1]).count(PLAYER_PIECE) == 2 
      brd[line[2]] = COMPUTER_PIECE
    elsif brd.values_at(line[0], line[2]).count(PLAYER_PIECE) == 2
      brd[line[1]] = COMPUTER_PIECE
    elsif brd.values_at(line[1], line[2]).count(PLAYER_PIECE) == 2
      brd[line[0]] = COMPUTER_PIECE
    else
      nil
    end
  end
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


# def score(detect_winner_output, score_hash) 
#  if detect_winner_output == "player"
#     score_hash[:player] += 1
#   elsif detect_winner_output == "computer"
#     score_hash[:computer] += 1
#   else detect_winner_output == nil
#     score_hash[:player] += 1
#     score_hash[:computer] += 1
#   end
#   score_hash
# end


loop do
# score_hash = {player: 0, computer: 0}
  player_score = 0
  computer_score = 0
  round = 1

    loop do # main game loop
      board = initialize_board
      loop do
        display_board(board, player_score, computer_score, round)
        
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
       
        computer_places_piece!(board)
        display_board(board, player_score, computer_score, round)
        break if someone_won?(board) || board_full?(board)
     
      end

      player_score += 1 if detect_winner(board) == 'player'
      computer_score += 1 if detect_winner(board) == 'computer'
      round += 1

      display_board(board, player_score, computer_score, round)

      if someone_won?(board)
        prompt("#{detect_winner(board)} wins the game!")
      else
        prompt("It's a tie")
      end

      break if player_score == 5 || computer_score == 5
    end

  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
 
prompt('Thanks for playing see you next time')
