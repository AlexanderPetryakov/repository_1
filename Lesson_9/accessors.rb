module Accessors

	def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history = []
      
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        history << value
      end

      define_method("#{name}_history".to_sym) { history }
    end
  end 

  def strong_attr_accessor(name, class_name)
    var_name = "@#{name}".to_sym

    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.class.to_s == class_name.to_s
        instance_variable_set(var_name, value)
      else
        raise 'Класс переменной не соответствует заявленному.' 
      end
    end
  end

end

class Test
  extend Accessors

  attr_accessor_with_history :a, :b, :c
  strong_attr_accessor :d, Fixnum
end