require_relative 'Station'
require_relative 'Train'
require_relative 'PassengerTrain'
require_relative 'CargoTrain'
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
  puts "3. Просмотр списка станций и поездов."
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
  when 3  # was 4
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
  loop do
    begin
      Station.new(ask_name)
      puts "Станция создана."
      break
    rescue RuntimeError => e
      puts "#{e.message}"
    end
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
    loop do
      begin
        PassengerTrain.new(ask_number)
        puts "Пассажирский поезд создан."
        break
      rescue RuntimeError => e
        puts "#{e.message}"
      end
    end
  when 2
    loop do
      begin
        CargoTrain.new(ask_number)
        puts "Грузовой поезд создан."
        break
      rescue RuntimeError => e
        puts "#{e.message}"
      end
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

def ask_number
  print "Введите номер поезда (Формат номера: XXX-XX): "
  number = gets.chomp
end

def list_all
  #stations = Station.all
  #trains = Train.all
  puts ""
  puts "Список станций."
  Station.all.each  { |station| puts "#{station.name}"}
  puts ""
  puts "Список поездов."
  Train.all.each  { |train| puts "Поезд №#{train.number}, #{train.type}."}

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