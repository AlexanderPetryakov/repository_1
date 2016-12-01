require_relative 'Train'
class PassengerTrain < Train

  def initialize(number)
    super
    self.type = "Пассажирский"
  end

  def add_wagons(wagon)
    if wagon.class == Coach
      super
    else
      puts "Тип вагона не подходит типу поезда."
    end
  end

end