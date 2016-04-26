require 'pry'
class School

attr_accessor :roster

  def initialize
    @roster = {}
  end

  def to_h
    if roster.select { |_, pupils| !pupils.empty? } == {}
      return {}
    else
     roster.each { |_, pupils| pupils.sort! }.sort.to_h
    end

  end

  def add(name, grade)
    return roster[grade] = [name] unless roster.include?(grade)
           roster[grade] += [name]
  end

  def grade(number)
    return [] unless roster.include?(number)
      roster[number]
  end

end




