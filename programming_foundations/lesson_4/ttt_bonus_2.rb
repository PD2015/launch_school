score_hash = {player: 0, computer: 0}

def score(detect_winner)
 if detect_winner == "player"
    score_hash[:player] =+ 1
  elsif detect_winner == "computer"
    score_hash[:computer] =+ 1
  else detect_winner == nil
    score_hash[:player] =+ 1
    score_hash[:computer] =+ 1
  end
  score_hash
end


def detect_winner
  "player"
end