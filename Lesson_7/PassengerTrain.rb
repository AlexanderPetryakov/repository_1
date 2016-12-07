require_relative 'Train'
class PassengerTrain < Train

  def initialize(number)
    super
    self.type = "Пассажирский"
  end

  def add_wagon(wagon)
    if wagon.class == Coach
      super
      true
    else
      false
    end
  end

end