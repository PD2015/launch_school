module RearDoorType

  def rear_door
    puts "#{name}'s got a sliding_door"
  end

end


class Vehicle

  attr_accessor :color
  attr_reader :year, :name

   @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.fuel_mileage(liters, kilometers)
    puts "#{kilometers/liters} kilometers per liter of fuel"
  end

  def initialize(year, color, model, name)
    @@number_of_vehicles += 1
    @name = name
    @year = year
    @color = color
    @model = model
    @current_speed = 0 
  end

  def current_speed
    p "your current speed is #{@current_speed} mph"
  end

  def speed_up(number)
    @current_speed += number
    p "You have just increased your speed by #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    p "You have just decreased your speed by #{number} mph."
  end

  def shut_off 
    @current_speed = 0
    p "You have now parked and are not moving. Your current speed is #{@current_speed} mph" 
  end

  def spray_paint(colour)
    self.color = colour
  end

  def age
    puts "#{name} is #{years_old} years old"
  end

  private

  def years_old
    Time.now.year - self.year
  end

end


class MyTruck < Vehicle
  include RearDoorType
  NUMBER_OF_DOORS = 3
end



class MyCar < Vehicle

   NUMBER_OF_DOORS = 5
 
  def to_s
     "this is all about #{name}"
  end

end


flo = MyCar.new(2007, 'white', 'toyota', 'flo')
flo.current_speed
flo.speed_up(20)
flo.current_speed
flo.brake(5)
flo.current_speed
flo.shut_off
flo.current_speed
flo.color = "blue"
p flo.inspect
p flo.year
flo.spray_paint('pink')
p flo.color
MyCar.fuel_mileage(10, 100)
puts flo
trevor = MyTruck.new(2010, 'orange', 'volvo', 'Trevor')
trevor.rear_door
Vehicle.number_of_vehicles
p MyCar.ancestors
p MyTruck.ancestors
p Vehicle.ancestors
trevor.age
flo.age






