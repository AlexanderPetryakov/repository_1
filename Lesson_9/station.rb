class Station
  require_relative 'validation.rb'
  include Validation

  attr_accessor :name

  NAME_FORMAT = /^[a-z0-9а-я]{5,}$/i

  validate :name, :presence
  validate :name, :format, NAME_FORMAT
  
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

    def train_arrival(train)
    @trains << train
    true
  end

  def trains_list
    @trains.each do |train|
      puts "Поезд номер #{train.number}, #{train.type}."
    end
  end

  def trains_list_by_type(type)
    train_amount = 0
    @trains.each { |train| train_amount += 1 if train.type == type }
    puts "Количество поездов типа #{type}: #{train_amount}."
  end

  def train_departure(train)
    if @trains.include?(train)
      @trains.delete(train)
      true
    else
      false
    end
  end

  def trains_to_block
    @trains.each { |train| yield(train) }
  end
end
