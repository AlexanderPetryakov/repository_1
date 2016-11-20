class Station

  def initialize(name)
    @name = name
    @trains_on_station = []
  end
  
  def get_name
    @name
  end  
  
  def train_arrival(train)
    @trains_on_station.push(train)
  end
  
  def get_trains_list
    @trains_on_station.each {|train| puts "#{train}"}
  end
  
  def get_trains_list_by_type
    freight_train_amount = 0
    passenger_train_amount = 0
    @trains_on_station.each do |train|
      if train.get_type == "грузовой"
        freight_train_amount += 1 
      else passenger_train_amount += 1 
      end
    end
    puts "Количество грузовых поездов: #{freight_train_amount}."
    puts "Количество пассажирских поездов: #{passenger_train_amount}."
  end
  
  def train_departure(train)
    @trains_on_station.delete(train)
  end
end
