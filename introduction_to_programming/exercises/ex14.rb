contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]

contacts = {"Joe Smith" => {} }


field = [:email, :address, :phone]



contacts.each do |name, hash|
  field.each do |field|
    hash[field] = contact_data.shift
  end
end

puts contacts


contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
