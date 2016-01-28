person = {name: "bob", occupation: "web developer", hobbies: "painting"}

ans1= person.has_value?("web developer")

ans2= person.fetch(:occupation, "write this if there is not")

puts ans1
puts ans2
