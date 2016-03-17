require 'pry'

ary = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def adding_punctuation!(ary, punctuation, h)
  ary.each do |number|
    if number == ary[-2] || number == ary[-1]
      h[number] = ""
    else
      h[number] = punctuation
    end  
  end
  h
end

def ary_to_hash!(ary2, h)
   h.each do |key, value|
    ary2 << key.to_s + value.to_s
  end
  ary2
end

def insert_ending_and_convert_to_string!(ary2, final_joiner)
  ary2.insert(-2, final_joiner).join(' ')
end

def joiner(ary, punctuation = ',', final_joiner = 'or' )
  h = {}
  ary2 = []
  if ary.size > 1
  adding_punctuation!(ary, punctuation, h)
  ary_to_hash!(ary2, h)
  insert_ending_and_convert_to_string!(ary2, final_joiner)
else
  ary.join
  end
end

# puts adding_punctuation!(ary, param = ',', h)

# p ary_to_hash!(ary2, h)

# p insert_ending_and_convert_to_string!(ary2, param = "or")

p joiner(ary, param1 = ',', param2 = 'or' )



# *************************
# official answer, results in one long string without spaces.
# def joiner(array, delimiter = ',', word = 'or')
#   array[-1] = "#{word} #{array.last}" if array.size > 1
#   array.join( delimiter)
# end


need to add to game :prompt "Choose a position to place a piece: #{joinor(empty_positions(board), ', ')}"