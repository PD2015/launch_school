
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  else
    puts "other"
  end
end

puts rps("rock", "rock")

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end


puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

1 rps( x , rock )
2 rps(rps("rock", "paper"), rps("rock", "scissors"))

3  "paper", "rock"

paper vs rock

paper