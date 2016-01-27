

def count_down(number)
  puts number
  if number > 0
    count_down(number-1)
  end
end


puts count_down(10)
