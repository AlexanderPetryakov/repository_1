module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :rules

    def validate(name, type, *args)
      @rules ||= []
      @rules << { type: type, name: name, args: args }
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue
      false
    end

    protected

    def validate!
      self.class.rules.each do |rule|
        ins = instance_variable_get("@#{rule[:name]}")
        send rule[:type], rule[:name], rule[:args], ins
      end
      true
    end

    def presence(name, args, ins)
      raise "Параметр #{name} не может быть пустым." if ins.to_s.empty?
    end

    def format(name, args, ins)
      raise "Параметр #{name} не соответствует формату." if ins.to_s !~ args[0]
    end

    def type(name, args, ins)
      raise "Класс переменной #{name} не соответствует заявленному." if ins.class != args[0]
    end
  end
end