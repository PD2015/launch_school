a1 = {:e=>"rolly", :f=>"polly", :g=>"slowly"}
a2 = {:a=>"easy", :b=>"peasy", :c=>"sleazy"}

non_mutated = a1.merge(a2)
puts non_mutated
puts a1
puts a2
mutated = a1.merge!(a2)
puts mutated
puts a1
puts a2
