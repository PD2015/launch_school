require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # lines
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonols

  def initialize
    @squares = {}
    reset
  end

  def get_square(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].mark = marker
  end

  def unmarked_keys
     @squares.keys.select {|key| @squares[key].unmarked?}
     # @squares[key] returns the value of the hash, which is a square object.
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def count_human_marker(squares)
    squares.collect(&:mark).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:mark).count(TTTGame::COMPUTER_MARKER)
  end

  def winning_marker
    WINNING_LINES.each do |line|

      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :mark

  def initialize(mark= INITIAL_MARKER)
    @mark = mark
  end

  def unmarked?
     mark == INITIAL_MARKER
  end

  def to_s
    @mark
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Noughts and Crosses!"
  end

  def clear_screen_and_display_board
  clear
  display_board
  end

  def display_board
  puts "You are #{human.marker}, computer is #{computer.marker}"  
  puts "            "
  puts "     |     |"
  puts "  #{board.get_square(1)}  |  #{board.get_square(2)}  |  #{board.get_square(3)}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board.get_square(4)}  |  #{board.get_square(5)}  |  #{board.get_square(6)}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board.get_square(7)}  |  #{board.get_square(8)}  |  #{board.get_square(9)}"
  puts "     |     |"
  puts "            "
  end

  def human_moves
    puts "Please select a square between (#{board.unmarked_keys.join(', ')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry thats not a valid choice"
    end
  
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You Won!"
    when COMPUTER_MARKER
      puts "You Lost!"
    when nil
      puts "Its a Tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Thats not a valid choice"
    end
    answer == 'y'
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Lets play again!"
    puts ""
  end

  def display_goodbye_message
    puts 'Thanks for playing, see you next time'
  end

  

  def play
    clear
    display_welcome_message
    loop do
      display_board
      loop do
        human_moves
        break if board.someone_won? || board.full?
        computer_moves
        break if board.someone_won? || board.full?
        
        clear_screen_and_display_board
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

end

game = TTTGame.new
game.play