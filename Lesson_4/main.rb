require_relative 'Station'
require_relative 'Train'
require_relative 'PassengerTrain'
require_relative 'CargoTrain'
require_relative 'Wagon'
require_relative 'Coach'
require_relative 'CargoWagon'


def main
  puts "--Система управления железной дорогой--"
  @stations = {}
  @trains = {}
  main_menu
end

def main_menu
  puts ""
  puts "Главное меню."
  puts "1. Создать новую станцию."
  puts "2. Создать новый поезд."
  puts "3. Редактировать существующий поезд"
  puts "4. Просмотр списка станций и поездов."
  puts "5. Выйти из программы."
  print "Введите номер пункта меню: "

  choice = gets.chomp.to_i

  case choice
  when 1
    #puts 1
    new_station
  when 2
    #puts 2
    new_train
  when 3
    #puts 3
    find_train
  when 4
    #puts 4
    list_all
  when 5
    exit
  else
    wrong_menu_choice
    main_menu
  end
end

def new_station
  puts ""
  puts "--Создание станции--"
  print "Введите название станции: "
  name = gets.chomp
  @stations[name] = Station.new(name)
  puts "1. Выйти в главное меню."
  puts "2. Создать ещё одну станцию."
  print "Введите номер пункта меню: "

  choice = gets.chomp.to_i

  case choice
  when 1
    main_menu
  when 2
    new_station
  else
    wrong_menu_choice
    main_menu
  end
end

def new_train
  puts ""
  puts "--Создание поезда--"
  puts "Выберите тип поезда:"
  puts "1. Пассажирский."
  puts "2. Грузовой."
  #puts "3. Выйти в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i
  print "Введите номер поезда: "
  number = gets.chomp

  case choice
  when 1
    @trains[number] = PassengerTrain.new(number)
  when 2
    @trains[number] = CargoTrain.new(number)
  #when 3
   # main_menu
  else
    wrong_menu_choice
    new_train
  end  

  puts "1. Выйти в главное меню."
  puts "2. Создать ещё один поезд."
  puts "3. Редактировать этот поезд."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i
  case choice
  when 1
    main_menu
  when 2
    new_train
  when 3
    edit_train(number)
  else
    wrong_menu_choice
    main_menu
  end
end

def find_train
  print "Введите номер поезда: "
  number = gets.chomp
  if @trains.has_key?(number)
    puts "Поезд найден!"
    edit_train(number)
  else
    puts "Поезд не найден! Повторите ввод."
    find_train
  end 
end

def edit_train(number)
  train = @trains[number]
  puts ""
  puts "Меню редактирования поезда № #{number}."
  puts "1. Прицепить вагон к поезду."
  puts "2. Отцепить вагон от поезда."
  puts "3. Поместить поезд на станцию."
  #puts "4. Удалить поезд."
  puts "4. Выбрать другой поезд."
  puts "5. Выйти в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i
  case choice
  when 1
    if train.class == PassengerTrain
      train.add_wagon(Coach.new)
    else
      train.add_wagon(CargoWagon.new)
    end
    edit_train(number)
  when 2
    train.delete_last_wagon
    edit_train(number)
  when 3
    #name = find_station
    add_train_to_station(number, find_station)
  #when 4
    #puts 4
    #delete_train_from_station(number, find_station)
  when 4
    find_train
  when 5
    main_menu
  else
    wrong_menu_choice
    main_menu
  end
end

def find_station
  print "Введите название станции: "
  name = gets.chomp
  if @stations.has_key?(name)
    puts "Станция найдена!"
    name
  else
    puts "Станция не найдена! Повторите ввод."
    find_station
  end 
end

def add_train_to_station(number, name)
  puts "Прибытие поезда № #{number} на станцию #{name}."
  station = @stations[name]
  #train = @trains[number]
  station.train_arrival(@trains[number])
  edit_train(number)
end

#def delete_train_from_station(number, name)
#  puts "Отбытие поезда № #{number} со станции #{name}."
 # station = @stations[name]
  #train = @trains[number]
  #station.train_departure(train)
 # edit_train(number)
#end

def list_all
  @stations.each_value do |station|
    puts ""
    puts "Станция: #{station.name}."
    station.get_trains_list
  end
  puts ""
  print "Перейти в главное меню? (нажмите Enter)"
  gets.chomp
  main_menu
end

def wrong_menu_choice
  puts ""
  puts "Неправильный номер пункта меню."
  puts ""
end

main