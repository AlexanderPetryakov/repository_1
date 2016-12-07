require_relative 'Wagon'
class Coach < Wagon
  
  attr_reader :capacity

  def initialize(capacity)
    super()
    @capacity = capacity
    @seats_taken = 0
    self.type = "Пассажирский"
  end

  def curr_capacity?
    @capacity - @seats_taken
  end

  def take_seat
    @seats_taken +=1 if @seats_taken < @capacity
  end

  def load(amount)
    @seats_taken += amount if @seats_taken < @capacity
  end

  def taken?
    @seats_taken
  end

  def free?
    @capacity - @seats_taken
  end

end