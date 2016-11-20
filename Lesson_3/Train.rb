class Train

  attr_accessor :speed
  attr_accessor :type

  def initialize(number, type, cars_amount)
    @number = number
    @type = type
    @cars_amount = cars_amount
    @speed = 0
  end

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
    @cars_amount -= 1 if (@speed == 0 && @cars_amount > 0)
  end
  
  def set_route(route)
    @stations_list = route.get_stations
    @current_station = 0
  end  
  
  def move
    @current_station += 1 if (@current_station + 1) < @stations_list.length
  end

  def get_stations_list
    previous_station = @current_station - 1
    if previous_station >= 0
      puts "Предыдущая станция: #{@stations_list.fetch(previous_station).name}" 
    else puts "Предыдущая станция: нет станции"
    end
    
    puts "Текущая станция: #{@stations_list.fetch(@current_station).name}" 
    
    next_station = @current_station + 1
    if next_station < @stations_list.length
      puts "Следующая станция: #{@stations_list.fetch(next_station).name}" 
    else puts "Следующая станция: нет станции"
    end
  end
end
    
          
