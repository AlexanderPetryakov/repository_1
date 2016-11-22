require_relative 'Wagon'
class Coach < Wagon

  def initialize
    super
    self.type = "Пассажирский"
  end

end