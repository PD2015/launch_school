def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method" }

# This programe raises an error becasue the argument being passed in does not call a block (& is absent). So when a block is passed in it essentially doesn see it.
