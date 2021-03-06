class Train

  attr_accessor :speed
  attr_reader :type
  attr_reader :number

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
  
  def add_wagon(wagon)
    if @speed == 0
    	@wagons << wagon
      puts "Вагон прицеплен!"
    else
    	puts "Поезд находится в движении."
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

  def delete_last_wagon
    if @speed != 0 
      puts "Поезд находится в движении."
    elsif @wagons.empty?
      puts "В составе поезда вагонов нет."
    else
      @wagons.delete_at(-1)
      puts "Вагон отцеплен!"
    end
  end

  protected

  attr_writer :type #Чтобы после создания поезда не было возможности изменить его тип

end