class Pet

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog

  def swim
    "can't swim!"
  end

class Cat < Pet
  def speak
    'Meow!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

charlie = Bulldog.new
puts charlie.speak
puts charlie.swim

ginger = Cat.new
puts ginger.speak
puts ginger.jump

pete = Pet.new
puts pete.run
puts pete.speak


# 3) Cat(speak) > Pet(run, jump)
   # Bulldog(swim) > Dog(Speak, swim, fetch) > Pet(run, jump)

   # 4) .ancestors
