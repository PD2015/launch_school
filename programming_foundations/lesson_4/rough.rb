def operation_to_message(op)
  word = case op
         when "+"
           "Adding"
         when "-"
           "Subtracting"
         when "*"
           "Multiplying"
         when "/"
           "Dividing"
         end
  word
end

puts operation_to_message("+")
a = "You Won! The Dealer went bust."
player_score = [0]
dealer_score = [0]

# def score(a)
output = case a
    when "You've won"  
      player_score.replace([player_score[0] + 1])
    when "You Won! The Dealer went bust."
      player_score.replace([player_score[0] + 1])
      # "option 1"
    when "The dealer Won." || "Sorry, thats you bust. The dealer Wins"
       dealer_score.replace([dealer_score[0] + 1])
       # "option 2"
    when "It's a Draw!"
       player_score.replace([player_score[0] + 1]) 
      dealer_score.replace([dealer_score[0] + 1])
      # "option 3"
    end 
   
#      output
# end

puts output