class Train

  #include Manufacturer
  attr_accessor :speed
  attr_reader :type
  attr_accessor :number

  NUMBER_FORMAT = /^[a-z0-9]{3}\-?[a-z0-9]{2}$/i

  @@instances = {}

  def self.find(number)
    @@instances[number]
  end

  def self.all
    output_arr = @@instances.values    
  end

  def initialize(number)        #number - строка
    @number = number
    validate!
    @type
    @wagons = []
    @speed = 0
    @@instances[@number] = self
  end

  def valid?
    validate!
  rescue
    false
  end

  def stop
    @speed = 0
  end

  def get_wagons_amount
    wagons.length
  end
  
  def add_wagon(wagon)
    if @speed == 0
    	@wagons << wagon
      true
    else
    	false
    end
  end

  def delete_wagon(wagon)
      if @speed != 0 
        puts "Поезд находится в движении."
      elsif !@wagons.include?(wagon)
        puts ("Вагона нет в составе поезда.")      
      else
     	  @wagons.delete(wagon)
    end
  end

  protected

  attr_writer :type

  def validate!
    raise 'Неправильный формат номера.' if number !~ NUMBER_FORMAT
    true
  end

end