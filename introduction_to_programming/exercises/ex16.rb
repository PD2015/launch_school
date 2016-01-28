a = ["white snow", "winter wonderland", "melting ice", "slippery sidewalk", "salted roads", "white trees"]

b = a.map do |value|
     value.split
    end

b.flatten!
p b

