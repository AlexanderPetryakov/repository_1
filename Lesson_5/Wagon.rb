class Wagon

  include Manufacturer
  attr_reader :loaded
  attr_reader :type
  
  def initialize
    @loaded = false
    @type
  end

  def load!
    self.loaded = true
  end

  def loaded?
    puts "Вагон загружен." if self.loaded == true
    puts "Вагон не загружен." if self.loaded == false
  end

  protected
  
  attr_writer :loaded  #доступ к записи свойства объекта через метод.
  #удобнее загружать вагон методом .load!, чем .loaded = true
  attr_writer :type  #Чтобы после создания вагона не было возможности изменить его тип  

end