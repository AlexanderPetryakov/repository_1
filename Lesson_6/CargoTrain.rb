require_relative 'Train'
class CargoTrain < Train

  def initialize(number)
    super
    self.type = "Грузовой"
  end

  def add_wagons(wagon, amount = 1)
    if wagon.class == CargoWagon
      super
    else
      puts "Тип вагона не подходит типу поезда."
    end
  end

end