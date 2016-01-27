a = ["black", "green", "blue", "purple", "pink"]

a.each_with_index do |color, index|
   puts "#{index + 1}) #{color}"
end
