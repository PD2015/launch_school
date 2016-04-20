require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # lines
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonols

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
  end
  # rubocop:enable Metrics/AbcSize

  def []=(key, marker)
    @squares[key].mark = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
    # @squares[key] returns the value of the hash, which is a square object.
  end

  def joiner(default = unmarked_keys, separator = ',', final_separator= 'or')
    if unmarked_keys.size < 2
      return unmarked_keys.join
    else
      joiner_unmarked_keys = unmarked_keys.map do |num|
        unless num == unmarked_keys[-2, 2]
        num.to_s + separator
        end
      end
      joiner_unmarked_keys.pop
      joiner_unmarked_keys[-1]= "#{unmarked_keys[-2]} #{final_separator} #{unmarked_keys.last}"
      return joiner_unmarked_keys.join(' ')
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.mark
      end
    end
    nil
  end

  def immediate_threat
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares)
        empty_square_array = squares.select { |sq| sq.mark == Square::INITIAL_MARKER }
        return @squares.key(empty_square[0])
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:mark)
    # this will select all square objects from the 3 squares that make up the line, if they
    # have a mark != INITIAL_MARKER. So will select the square objects. Then the collect method
    # will run square.mark on each square object to return an array of the marks of each square.
    return false if markers.size != 3
    markers.min == markers.max
    # will return the string of the array that containes the letter closest to A. Max to Z,
    # if these are the same = 3 strings the same.
    # or markers.uniq!.size == 1
  end

  def two_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:mark)
    return false if markers.size != 2
    markers.uniq.size == 1
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

  def marked?
    mark != INITIAL_MARKER
  end

  def to_s
    @mark
  end
end

class Player
  attr_reader :marker 
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    loop do
      display_board
      display_scores
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
        display_scores
      end
      increment_score if board.someone_won?
      display_result
      display_scores
      break if game_won?
      break unless play_again?
      reset
      display_play_again_message
    end
    display_game_result
    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Noughts and Crosses!"
    puts "The first player to 5 points wins the game!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You are #{human.marker}, computer is #{computer.marker}"
    puts "            "
    board.draw
    puts "     |     |"
    puts "            "
  end

  def human_moves
    puts "Please select a square: #{board.joiner}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry thats not a valid choice"
    end
    board[square] = human.marker
  end

  def computer_moves
     # binding.pry
    if board.immediate_threat == nil
      board[board.unmarked_keys.sample] = computer.marker
    else
      board[board.immediate_threat] = computer.marker
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
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

   def increment_score
      if board.winning_marker == HUMAN_MARKER
        human.score += 1
      else
        computer.score += 1
      end
  end

  def display_scores
    puts "You have #{human.score}, the computer has #{computer.score}"
  end

  def game_won?
      human.score == 5 || computer.score == 5
  end

  def display_game_result
     game_won?
     if human.score == 5
      puts "You've got 5 points and won the game!!"
    else
      puts "The computer has beaten you to 5 points, you've lost the game:("
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
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Lets play again!"
    puts ""
  end

  def display_goodbye_message
    puts 'Thanks for playing, see you next time'
  end
end

game = TTTGame.new
game.play
