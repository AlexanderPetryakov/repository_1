require_relative 'Train'
class CargoTrain < Train

  def initialize(number)
    super
    self.type = "Грузовой"
  end

  def add_wagon(wagon)
    if wagon.class == CargoWagon
      super
      true
    else
      false
    end
  end

end