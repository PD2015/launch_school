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
    if rock?
      return true if other_value.scissors?
    elsif paper?
      return true if other_value.rock?
    else scissors?
      return true if other_value.paper?
    end
  end

  def <(other_value)
    if rock?
      return true if other_value.paper?
    elsif paper?
      return true if other_value.scissors?
    else scissors?
      return true if other_value.rock?
    end     
  end

  # def to_s
  #   @value
  # end

end

class Player

  attr_accessor :move, :name

  def initialize
    set_name
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
  end

  def display_winner
    puts "#{human.name} chose *#{human.move.value.capitalize}*"
    puts "#{computer.name}, (the computer) chose *#{computer.move.value.capitalize}*"
    
    if human.move > computer.move
      puts 'You Win!'
    elsif human.move < computer.move
      puts 'You Loose!'
    else
      puts 'Its a Tie!'
    end 


    # case human.move
    # when 'rock'
    #   puts 'You Win!' if computer.move == 'scissors'
    #   puts 'You Loose!' if computer.move == 'paper'
    #   puts 'You Tie!' if computer.move == 'rock'
    # when 'paper'
    #   puts 'You Win!' if computer.move == 'rock'
    #   puts 'You Loose!' if computer.move == 'scissors'
    #   puts 'You Tie!' if computer.move == 'paper'
    # when 'scissors'
    #   puts 'You Win!' if computer.move == 'paper'
    #   puts 'You Loose!' if computer.move == 'rock'
    #   puts 'You Tie!' if computer.move == 'scissors'
    # end


  end

  def play_again?
    ans = nil
    loop do
      puts "Would you like to play again? (y/n)"
      ans = gets.chomp.downcase
      break if ['y', 'n'].include?(ans)
      puts "sorry your answer must be either y or n"
    end
    return true if ans == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing, catch you later"
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again? 
    end
    display_goodbye_message    
  end
end

RPSGame.new.play