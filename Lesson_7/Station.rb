class Station

  attr_accessor :name

  NAME_LENGTH = 5

  @@instances = {}

  def self.find(name)
    @@instances[name]
  end

  def self.all
    @@instances.values    
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@instances[name] = self
  end

  def valid?
    validate!
  rescue
    false
  end
  
  def train_arrival(train)
    @trains << train
    true
  end
  
  def get_trains_list
     @trains.each do |train| 
      #print "#{train.number} "
      puts "Поезд номер #{train.number}, #{train.type}."
    end
  end
  
  def get_trains_list_by_type(type)
    train_amount = 0
    @trains.each {|train| train_amount += 1 if train.type == type}      
    puts "Количество поездов типа #{type}: #{train_amount}."
  end
  
  def train_departure(train)
    if @trains.include?(train)
      @trains.delete(train)
      #puts "Поезд отбыл со станции!"
      true
    else
      #puts "Поезд уже отбыл."
      false
    end
  end

  def trains_to_block(block)
    @trains.each {|train| block.call(train)}
  end

  protected

  def validate!
    raise 'Неправильный формат названия.' if name.length < NAME_LENGTH
    true
  end
  
end
