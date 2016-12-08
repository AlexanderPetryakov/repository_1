class Wagon
  attr_reader :type
  attr_reader :number

  def initialize(capacity)
    @capacity = capacity
    @type = ''
    @number = (Random.rand * 1_000_000).to_i
  end

  protected

  attr_writer :type
end
