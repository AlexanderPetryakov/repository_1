class Wagon

  #include Manufacturer
  attr_reader :type
  attr_reader :number
  
  def initialize
    @type
    @number = ((Random.rand)*1000000).to_i
  end

  
  protected
  
  attr_writer :type  #Чтобы после создания вагона не было возможности изменить его тип  

end