# Alyssa has been assigned a task of modifying a class that was initially created 
# to keep track of secret information. The new requirement calls for adding logging, 
# when clients of the class attempt to access the secret data. Here is the class in 
# its current form:

# She needs to modify it so that any access to data must result in a 
# log entry being generated. That is, any call to the class which will result 
# in data being returned must first call a logging class. The logging class has 
# been supplied to Alyssa and looks like the following

# Hint: Assume that you can modify the initialize method in SecretFile to have an 
# instance of SecurityLogger be passed in as an additional argument. 
# It may be helpful to review the lecture on collaborator objects for this exercise.

# class SecretFile 

#   def initialize(secret_data, log_entry)
#     @data = secret_data
#     @log_entry = log_entry
#   end

#   def data
#     @log_entry.create_log_entry
#     @data
#   end
# end


# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end

# 2)
# Ben and Alyssa are working on a vehicle management system. 
# So far, they have created classes called Auto and Motorcycle to 
# represent automobiles and motorcycles. After having noticed common 
# information and calculations they were performing for each type of vehicle, 
# they decided to break out the commonality into a separate class called WheeledVehicle. 
# This is what their code looks like so far:
# Now Alan has asked them to incorporate a new type of vehicle into their 
# system - a Catamaran defined as follows:
# This new class does not fit well with the object hierarchy defined so far. 
# Catamarans don't have tires. But we still want common code to track fuel efficiency 
# and range. Modify the class definitions and move code into a Module, as necessary, 
# to share code among the Catamaran and the wheeled vehicles.

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity

   def range
    @fuel_capacity * @fuel_efficiency
  end

end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

 
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end

class Boat 
  include Moveable
  attr_accessor :propeller_count, :hull_count
  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    @fuel_efficiency = fuel_efficiency
    @fuel_capacity = fuel_capacity
  end

  def range
    movable_range = super
    return movable_range + 10
  end
end

class Catamaran < Boat 
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super
  end
end

class Motorboat < Boat
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end
