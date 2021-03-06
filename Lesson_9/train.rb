class Train
  require_relative 'validation.rb'
  include Validation

  attr_accessor :speed
  attr_reader :type, :number

  NUMBER_FORMAT = /^[a-z0-9]{3}\-?[a-z0-9]{2}$/i

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  @@instances = {}

  def self.find(number)
    @@instances[number]
  end

  def self.all
    @@instances.values
  end

  def initialize(number) # number - string
    @number = number
    validate!
    @type = ''
    @wagons = []
    @speed = 0
    @@instances[number] = self
  end

  def stop
    @speed = 0
  end

  def wagons_amount
    @wagons.length
  end

  def add_wagon(wagon)
    if @speed.zero?
      @wagons << wagon
      true
    else
      false
    end
  end

  def delete_wagon(wagon)
    if @speed != 0
      puts 'Поезд находится в движении.'
    elsif !@wagons.include?(wagon)
      puts 'Вагона нет в составе поезда.'
    else
      @wagons.delete(wagon)
    end
  end

  def wagons_to_block
    @wagons.each { |wagon| yield(wagon) }
  end

  def wagons_to_block_with_index
    @wagons.each_with_index { |wagon, index| yield(wagon, index + 1) }
  end

  protected

  attr_writer :type

end
