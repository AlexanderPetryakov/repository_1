require_relative 'train'
class PassengerTrain < Train

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  
  def initialize(number)
    super
    self.type = 'Пассажирский'
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
