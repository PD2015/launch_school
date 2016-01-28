hash = {a: "bobby", b: "the bear", c: "Tilly the eagle", d: "billy the goat"}


hash.keys.each do |key|
  puts key
end

hash.values.each do |value|
  puts value
end


hash.each do |key, value|
  puts key
  puts value 
end
