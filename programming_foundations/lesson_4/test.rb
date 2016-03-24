someone = ''
other = ''


def who_goes?(someone, other)
  loop do
    puts "Who should take the first move? You(y) or the computer(c)?"
    ans = gets.chomp.downcase
    if ans == 'y'
      someone <<'player'
      other << 'computer'
      break
    elsif ans == 'c'
      someone << 'computer'
      other << 'player'

      break
    else
      puts "sorry thats not a valid option"
    end
  end
end

puts who_goes?(someone, other)
puts someone