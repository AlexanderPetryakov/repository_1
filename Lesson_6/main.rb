require_relative 'Station'
require_relative 'Train'
require_relative 'PassengerTrain'
require_relative 'CargoTrain'
require_relative 'Route'
#require_relative 'Wagon'
#require_relative 'Coach'
#require_relative 'CargoWagon'


def start
  puts "--Система управления железной дорогой--"
  puts ""
  main_menu
end

def main_menu
  puts "Главное меню."
  puts "1. Создать новую станцию."
  puts "2. Создать новый поезд."
  #puts "3. Редактировать существующий поезд"
  puts "3. Cоздать новый маршрут."
  puts "4. Просмотр списка станций, поездов и маршрутов."
  puts "0. Выйти из программы."
  print "Введите номер пункта меню: "

  choice = gets.chomp.to_i

  case choice
  when 1
    #puts 1
    new_station
  when 2
    #puts 2
    new_train
  #!!
  #when 3
   # puts 3
    #find_train
    #!!
  when 3
    #puts 3
    new_route
  when 4
    #puts 4
    list_all
  when 0
    exit
  else
    wrong_menu_choice
    main_menu
  end
end

def new_station
  puts ""
  puts "--Создание станции--"
  begin
    Station.new(ask_name)
    puts "Станция создана."
  rescue RuntimeError => e
    puts "#{e.message}"
    retry
  end

  puts "1. Создать ещё одну станцию."
  puts "0. Выйти в главное меню."
  print "Введите номер пункта меню: "

  choice = gets.chomp.to_i

  case choice
  when 0
    main_menu
  when 1
    new_station
  else
    wrong_menu_choice
    main_menu
  end
end

def ask_name
  print "Введите название станции (не менее пяти символов): "
  name = gets.chomp
end


def new_train
  puts ""
  puts "--Создание поезда--"
  puts "Выберите тип поезда:"
  puts "1. Пассажирский."
  puts "2. Грузовой."
  puts "0. Выйти в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i
  
  case choice
  when 1
    begin
      PassengerTrain.new(ask_train_number)
      puts "Пассажирский поезд создан."
    rescue RuntimeError => e
      puts "#{e.message}"
      retry
    end
    
  when 2
    begin
      CargoTrain.new(ask_train_number)
      puts "Грузовой поезд создан."
    rescue RuntimeError => e
      puts "#{e.message}"
      retry
    end
    
  when 0
    main_menu
  else
    wrong_menu_choice
    new_train
  end  

  puts "1. Создать ещё один поезд."
  puts "0. Выйти в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i
  case choice
  when 1
    new_train
  when 0
    main_menu
  else
    wrong_menu_choice
    main_menu
  end
end

def ask_train_number
  print "Введите номер поезда (Формат номера: XXX-XX): "
  number = gets.chomp
end

def new_route
  puts ""
  puts "--Создание маршрута--"
  puts "1. Создать новый маршрут."
  puts "0. Выйти в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i

  case choice
  when 1
    begin
      Route.new(ask_route_number, ask_depSt_name, ask_arrSt_name)
      puts "Маршрут создан."
    rescue RuntimeError => e
      puts e.message
      retry
    end
  when 0
    main_menu
  else
    wrong_menu_choice
    new_route
  end

  puts "1. Создать ещё один маршрут."
  puts "0. Выйти в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i
  case choice
  when 1
    new_route
  when 0
    main_menu
  else
    wrong_menu_choice
    main_menu
  end
end

def ask_route_number
  print "Введите номер маршрута (Формат номера: XXX): "
  number = gets.chomp
end

def ask_depSt_name
  print "Введите название станции отправления (не менее пяти символов): "
  depStName = gets.chomp
  #if Station.find(depStName) == nil
  #  puts "Станция не найдена, повторите ввод."
  #  ask_depSt_name
  #else
    depSt = Station.find(depStName)   
  #end
end

def ask_arrSt_name
  print "Введите название станции прибытия (не менее пяти символов): "
  arrStName = gets.chomp
  #if Station.find(arrStName) == nil
  #  puts "Станция не найдена, повторите ввод."
  #  ask_arrSt_name
  #else
    arrSt = Station.find(arrStName)
  #end
end


def list_all
  puts ""
  puts "Список станций."
  Station.all.each  { |station| puts "#{station.name}"}
  puts ""
  puts "Список поездов."
  Train.all.each  { |train| puts "Поезд №#{train.number}, #{train.type}."}
  puts ""
  puts "Список маршрутов."
  Route.all.each  do |route|
    puts "Маршрут №#{route.number}."
    route.get_stations_list
  end

  puts ""
  print "Чтобы перейти в главное меню нажмите Enter."
  gets.chomp
  main_menu
end

def wrong_menu_choice
  puts ""
  puts "Неправильный номер пункта меню."
  puts ""
end

start