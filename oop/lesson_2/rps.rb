class Move
  VALUES = ['rock', 'paper', 'scissors']
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_value)
    (rock? && other_value.scissors?) ||
      (paper? && other_value.rock?) ||
      (scissors? && other_value.paper?)
  end

  def <(other_value)
    (rock? && other_value.paper?) ||
      (paper? && other_value.scissors?) ||
      (scissors? && other_value.rock?)
  end
  # def to_s
  #   @value
  # end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end

  def increment_score!
    self.score += 1
  end

  def display_score
    print "#{self.name} has: #{self.score}  "
  end

  def score_reset
    self.score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Please enter your name:"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value "
    end
    self.name = n
  end

  def choose
    human_choice = nil
    loop do
      puts "Please make a choice: Rock, Paper or Scissors?"
      human_choice = gets.chomp.downcase
      if Move::VALUES.include?(human_choice)
        break
      else
        puts "Sorry that was not a valid choice"
      end
    end
    self.move = Move.new(human_choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'ET', 'Wallie'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hello #{human.name}. Welcome to the Rock, Paper, Scissors Game!"
    puts "The first player to 10 points wins the match!"
  end

  def display_move
    puts "#{human.name} chose *#{human.move.value.capitalize}*"
    puts "#{computer.name}, (the computer) chose *#{computer.move.value.capitalize}*"
  end

  def display_winner
    if human.move > computer.move
      puts 'You Win!'
      human.increment_score!
    elsif human.move < computer.move
      puts 'You Loose!'
      computer.increment_score!
    else
      puts 'Its a Tie!'
      human.increment_score!
      computer.increment_score!
    end
  end

  def score_output
    puts "***********************"
    puts "#{human.display_score}"
    puts "#{computer.display_score}"
    puts "***********************"
  end

  def display_match_winner
    if human.score == 10
      puts "Well done #{human.name}, You've won the match! "
      return true
    elsif computer.score == 10
      puts "You've Lost the Match! The Computers Won!!"
      return true
    end
    return false
  end

  def score_reset
    human.score_reset
    computer.score_reset
  end

  def play_again?
    ans = nil
    loop do
      puts "Would you like to play again? (y/n)"
      ans = gets.chomp.downcase
      break if ['y', 'n'].include?(ans)
      puts "sorry your answer must be either y or n"
    end
    return false if ans == 'n'
    return true if ans == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing, catch you later"
  end

  def play
    system 'clear'
    display_welcome_message
    # loop do
    # score_reset
    # score_output
      loop do
        human.choose
        computer.choose
        system 'clear'
        display_move
        display_winner
        score_output
        break if !!display_match_winner
        break unless play_again?
      end 
    # break unless play_again?
    # end
     display_goodbye_message
  end
end

RPSGame.new.play
