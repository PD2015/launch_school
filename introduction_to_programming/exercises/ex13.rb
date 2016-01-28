

contacts = {
		"Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"}, 
		"Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.", :phone=>"123-234-3454"}
	   } 


joes_email = contacts["Joe Smith"][:email]
sallys_phone = contacts["Sally Johnson"][:phone]

puts joes_email
puts sallys_phone

# or 

puts "Joes email is #{contacts["Joe Smith"][:email]}"
puts "Sallys Phone Number is #{contacts["Sally Johnson"][:phone]}"

