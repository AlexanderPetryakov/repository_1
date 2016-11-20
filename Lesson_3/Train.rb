class Train

  def initialize(number, type, cars_amount)
    @number = number
    @type = type
    @cars_amount = cars_amount
    @speed = 0
  end
  
  attr_accessor :speed
    
  def stop
    @speed = 0
  end

  def get_cars_amount
    puts "Количество вагонов = #{@cars_amount}"
  end
  
  def add_car
    @cars_amount += 1 if @speed == 0
  end

  def delete_car
    @cars_amount -= 1 if @speed == 0
  end
  
  def set_route(route)
    @stations_list = route.get_stations
    @break_station = Station.new("Станция отсутствует")
    @previous_station = @break_station
    @current_station = @stations_list[0]
    @next_station = @stations_list[1]
  end  
  
  def move
    @previous_station = @current_station
    @current_station = @next_station
    index = @stations_list.index(@current_station)
    index += 1
    @next_station = @stations_list[index]
    @next_station = @break_station if @next_station.nil?
  end

  def get_stations_list
    #@stations_list.each {|station| puts "#{station.get_name}"}
    puts "Предыдущая станция: #{@previous_station.get_name}"
    puts "Текущая станция: #{@current_station.get_name}"
    puts "Следующая станция: #{@next_station.get_name}"
  end
end
    
          
