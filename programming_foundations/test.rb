require 'pry'

ary = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def adding_punctuation!(ary, param = ',', h)
  ary.each do |number|
    if number == ary[-2] || number == ary[-1]
      h[number] = ""
    else
      h[number] = param
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

def insert_ending_and_convert_to_string!(ary2, param = "or")
  ary2.insert(-2, param).join(' ')
end

def joiner(ary, param1 = ',', param2 = 'or' )
  h = {}
  ary2 = []
  adding_punctuation!(ary, param1, h)
  ary_to_hash!(ary2, h)
  insert_ending_and_convert_to_string!(ary2, param2 = "or")
end

# puts adding_punctuation!(ary, param = ',', h)

# p ary_to_hash!(ary2, h)

# p insert_ending_and_convert_to_string!(ary2, param = "or")

p joiner(ary, param1 = ',', param2 = 'or' )