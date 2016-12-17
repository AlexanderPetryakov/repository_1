require_relative 'train'
class CargoTrain < Train

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  
  def initialize(number)
    super
    self.type = 'Грузовой'
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
