class Player

  attr_accessor :choice, :name

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
        if ['rock', 'paper', 'scissors'].include?(human_choice)
          break
        else
          puts "Sorry that was not a valid choice"
        end
      end
    self.choice = human_choice
  end

end

class Computer < Player

  def set_name
    self.name = ['R2D2', 'ET', 'Wallie'].sample
  end

  def choose
     self.choice = ['rock', 'paper', 'scissors'].sample
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
    puts "#{human.name} chose *#{human.choice.capitalize}*"
    puts "#{computer.name}, (the computer) chose *#{computer.choice.capitalize}*"
    case human.choice
    when 'rock'
      puts 'You Win!' if computer.choice == 'scissors'
      puts 'You Loose!' if computer.choice == 'paper'
      puts 'You Tie!' if computer.choice == 'rock'
    when 'paper'
      puts 'You Win!' if computer.choice == 'rock'
      puts 'You Loose!' if computer.choice == 'scissors'
      puts 'You Tie!' if computer.choice == 'paper'
    when 'scissors'
      puts 'You Win!' if computer.choice == 'paper'
      puts 'You Loose!' if computer.choice == 'rock'
      puts 'You Tie!' if computer.choice == 'scissors'
    end
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