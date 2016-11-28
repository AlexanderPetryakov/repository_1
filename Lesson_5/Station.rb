class Station

  attr_accessor :name

  @@instances = {}

  def self.all
    output_arr = @@instances.values    
    output_arr
  end

  def initialize(name)
    @name = name
    @trains_on_station = []
    @@instances[name] = self
  end
  
  def train_arrival(train)
    @trains_on_station << train
    puts "Поезд прибыл на станцию!"
  end
  
  def get_trains_list
    puts "Список поездов на станции."
    @trains_on_station.each do |train| 
      #print "#{train.number} "
      puts "Поезд номер #{train.number}, #{train.type}."
    end
  end
  
  def get_trains_list_by_type(type)
    train_amount = 0
    @trains_on_station.each {|train| train_amount += 1 if train.type == type}      
    puts "Количество поездов типа #{type}: #{train_amount}."
  end
  
  def train_departure(train)
    if @trains_on_station.include?(train)
      @trains_on_station.delete(train)
      puts "Поезд отбыл со станции!"
    else
      puts "Поезд уже отбыл."
    end
  end
  
end
