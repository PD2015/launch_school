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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# ******* methods for improved join method ******
def adding_punctuation!(ary, punctuation, h)
  ary.each do |number|
    if number == ary[-2] || number == ary[-1]
      h[number] = ""
    else
      h[number] = punctuation
    end  
  end
  h
end

def ary_to_hash!(ary2, h)
   h.each do |key, value|
    ary2 << key.to_s + value.to_s
  end
  ary2
end

def insert_ending_and_convert_to_string!(ary2, final_joiner)
  ary2.insert(-2, final_joiner).join(' ')
end

def joiner(ary, punctuation = ',', final_joiner = 'or' )
  h = {}
  ary2 = []
  if ary.size > 1
  adding_punctuation!(ary, punctuation, h)
  ary_to_hash!(ary2, h)
  insert_ending_and_convert_to_string!(ary2, final_joiner)
else
  ary.join
  end
end
# ****************************

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Please select a square #{joiner(empty_squares(brd))}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt('Sorry thats not a valid choice')
  end
  brd[square] = PLAYER_PIECE
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = detect_immediate_threat(line, brd)  
    if square
      break
    else square = detect_possible_comp_win(line, brd)
      break if square
    end
  end

  if !square
    square = empty_squares(brd).sample 
  end

  brd[square] = COMPUTER_PIECE
end


def detect_immediate_threat(line, brd)
    if brd.values_at(*line).count(PLAYER_PIECE) == 2
      brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
       # first part selects  key/value pair from brd array where value == ' '
       # This returns a hash with one pair {9 => ' '}
       # don't know how it knows to select the key/value pair of the line thats a threat?
       # as line above returns true. So all lines go into the block.
       # .keys selects the key out and returns as an array [9]
       # .first returns the integer 9 from the array.
    else
     nil
    end
end

def detect_possible_comp_win(line, brd)
  if brd.values_at(*line).count(COMPUTER_PIECE) == 2
      brd.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    else
     nil
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


loop do
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
