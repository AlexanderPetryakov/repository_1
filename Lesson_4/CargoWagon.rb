require_relative 'Wagon'
class CargoWagon < Wagon

  def initialize
    super
    self.type = "Грузовой"
  end

end