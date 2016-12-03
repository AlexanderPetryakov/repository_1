class Route

  attr_reader :number

  NUMBER_LENGTH = 3

  @@instances = {}

  def self.find(number)
    @@instances[number]
  end

  def self.all
    @@instances.values
  end

  def initialize(number, from, to)
    @number = number
    validate_number!
    validate_station!(from, to)
    @stations_list = [from,to]
    @@instances[number] = self
  end

  def add_station(station)
    @stations_list.insert(-2, station)
  end

  def delete_station(station)
    @stations_list.delete(station)
  end

  def get_stations_list
    @stations_list.each {|station| puts station.name}
  end

  def get_stations
    @stations_list
  end

  protected

  attr_writer :number

  def validate_number!
    raise 'Неправильный формат номера.' if number.length < NUMBER_LENGTH
  end

  def validate_station!(from, to)
    raise 'Ошибка ввода. Станция отправления должна быть типа "Station".' if from.class != Station
    raise 'Ошибка ввода. Станция прибытия должна быть типа "Station".' if to.class != Station
  end



end
