class Vehicle

   @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts @@number_of_vehicles
  end

  def initialize
    @@number_of_vehicles += 1
  end

end

class Car < Vehicle

  attr_accessor :make

  def initialize(make)
    @make = make
  end

end

herbie = Car.new('VW Beetle')
p herbie.make
Vehicle.number_of_vehicles