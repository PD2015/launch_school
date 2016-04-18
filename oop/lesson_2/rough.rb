class Test

attr_accessor :a1

  def initialize
    @a1 = []
  end

  def add_to_array(string)
    a1 << string
  end

  # def <<(argument)
  #   @a1 <<argument
  # end
end

test1 = Test.new
test1.add_to_array('the cat')
p test1.a1
test1.add_to_array('sat on')
p test1.a1