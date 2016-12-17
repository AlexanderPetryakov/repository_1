class Route
  require_relative 'validation.rb'
  include Validation

  attr_reader :number

  NUMBER_FORMAT = /^[0-9]{3,}$/

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :from, :type, Station
  validate :to, :type, Station

  @@instances = {}

  def self.find(number)
    @@instances[number]
  end

  def self.all
    @@instances.values
  end

  def initialize(number, from, to)
    @number = number
    @from = from
    @to = to
    validate!
    @stations_list = [from, to]
    @@instances[number] = self
  end

  def add_station(station)
    @stations_list.insert(-2, station)
  end

  def delete_station(station)
    @stations_list.delete(station)
  end

  def stations_list
    @stations_list.each { |station| puts station.name }
  end

  def stations
    @stations_list
  end

  protected

  attr_writer :number
  
end
