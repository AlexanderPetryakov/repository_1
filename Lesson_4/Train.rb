class Train

  attr_accessor :speed
  attr_reader :type

  def initialize(number)
    @number = number
    @type
    @wagons = []
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def get_wagons_amount
    puts "Количество вагонов = #{@wagons.length}"
  end
  
  def add_wagons(wagon, amount = 1)
    if @speed == 0
    	@wagons.concat(Array.new(amount, wagon))
    else
    	puts "Поезд находится в движении."
    end
  end

  def delete_wagons(amount = 1)
    if @speed != 0 
      puts "Поезд находится в движении."
    elsif @wagons.length <= amount - 1
    	@wagons.clear
    else
     	@wagons.slice!(0, amount)   #удаление вагонов
    end
  end

  protected

  attr_writer :type #Чтобы после создания поезда не было возможности изменить его тип

end