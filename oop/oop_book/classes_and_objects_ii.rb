# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade

#   end

#   protected

#   def grade
#     @grade
#   end

# end

# joe = Student.new('joe', 36)
# bob = Student.new('bob', 27)

# puts "Well done!" if joe.better_grade_than?(bob)



class Person

  def initalize
    
  end

  def greeting
    hi
  end

  private

  def hi
    puts "hi"
  end

end


bob = Person.new
bob.greeting
