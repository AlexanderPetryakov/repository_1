require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'wagon'
require_relative 'coach'
require_relative 'cargo_wagon'

def start
  puts ''
  puts '--Система управления железной дорогой--'
  main_menu
end

def main_menu
  main_menu_text
  main_menu_choice
end

def main_menu_text
  puts ''
  puts '--Главное меню--'
  puts '1. Создать новую станцию.'
  puts '2. Создать новый поезд.'
  puts '3. Редактировать существующий поезд'
  puts '4. Просмотр списка станций и поездов.'
  puts '0. Выйти из программы.'
  print 'Введите номер пункта меню: '
end

def main_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    new_station
  when 2
    new_train
  when 3
    edit_train_menu
  when 4
    list_menu
  when 0
    exit
  else
    wrong_menu_choice
    main_menu
  end
end

def new_station
  puts ''
  puts '--Создание станции--'
  new_station_create
  new_station_text
  new_station_choice
end

def new_station_text
  puts ''
  puts '1. Создать ещё одну станцию.'
  puts '0. Выйти в главное меню.'
  print 'Введите номер пункта меню: '
end

def new_station_create
  Station.new(ask_name)
  puts 'Станция создана.'
rescue RuntimeError => e
  puts e.message
  retry
end

def new_station_choice
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
  print 'Введите название станции (не менее пяти символов): '
  gets.chomp
end

def new_train
  new_train_menu_text
  new_train_choice
  new_train_text
  new_train_choice2
end

def new_train_menu_text
  puts ''
  puts '--Создание поезда--'
  puts 'Выберите тип поезда:'
  puts '1. Пассажирский.'
  puts '2. Грузовой.'
  puts '0. Выйти в главное меню.'
  print 'Введите номер пункта меню: '
end

def new_train_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    pass_train_new
  when 2
    cargo_train_new
  when 0
    main_menu
  else
    wrong_menu_choice
    new_train
  end
end

def pass_train_new
  PassengerTrain.new(ask_train_number)
  puts 'Пассажирский поезд создан.'
rescue RuntimeError => e
  puts e.message
  retry
end

def cargo_train_new
  CargoTrain.new(ask_train_number)
  puts 'Грузовой поезд создан.'
rescue RuntimeError => e
  puts e.message
  retry
end

def new_train_text
  puts ''
  puts '1. Создать ещё один поезд.'
  puts '0. Выйти в главное меню.'
  print 'Введите номер пункта меню: '
end

def new_train_choice2
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
  print 'Введите номер поезда (Формат номера: XXX-XX): '
  gets.chomp
end

def edit_train_menu
  edit_train_menu_text
  edit_train_menu_choice
end

def edit_train_menu_text
  puts ''
  puts '--Меню редактирования поездов--'
  puts '1. Добавить вагоны к поезду и загрузить поезд.'
  puts '2. Поместить поезд на станцию.'
  puts '0. Выйти в главное меню.'
  print 'Введите номер пункта меню: '
end

def edit_train_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    wagons_to_train
  when 2
    train_to_station
  when 0
    main_menu
  else
    wrong_menu_choice
    main_menu
  end
end

def wagons_to_train
  train = Train.find(ask_train_number)
  if train.nil?
    no_train
  elsif train.wagons_amount > 0
    puts ''
    puts "К поезду №#{train.number} уже были прицеплены вагоны."
    edit_train_menu
  else
    wagons_to_train_execute(train)
  end
  edit_train_menu
end

def no_train
  puts ''
  puts 'Поезда с таким номером не существует.'
end

def wagons_to_train_execute(train)
  print 'Введите количество вагонов, которое Вы хотите прицепить: '
  amount = gets.chomp.to_i
  if train.class == PassengerTrain
    amount.times do
      train.add_wagon(Coach.new(36))
    end
  else
    amount.times do
      train.add_wagon(CargoWagon.new(72))
    end
  end
  load_train(train)
end

def no_station
  puts ''
  puts 'Станции с таким названием не существует.'
end

def load_train(train)
  train.wagons_to_block do |wagon|
    wagon.load(Random.rand(wagon.curr_capacity?))
  end
  puts ''
  puts "К поезду №#{train.number} прицеплены вагоны, вагоны загружены."
end

def train_to_station
  train = Train.find(ask_train_number)
  if train.nil?
    no_train
    edit_train_menu
  else
    station = ask_arrst_name
    if station.nil?
      no_station
      edit_train_menu
    else
      station.train_arrival(train)
    end
  end
  puts ''
  puts "Поезд №#{train.number} прибыл на станцию #{station.name}."
  main_menu
end

def new_route
  new_route_menu_text
  new_route_menu_choice
  new_route_text2
  new_route_choice2
end

def new_route_menu_text
  puts ''
  puts '--Создание маршрута--'
  puts '1. Создать новый маршрут.'
  puts '0. Выйти в главное меню.'
  print 'Введите номер пункта меню: '
end

def new_route_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    new_route_create
  when 0
    main_menu
  else
    wrong_menu_choice
    new_route
  end
end

def new_route_create
  Route.new(ask_route_number, ask_depst_name, ask_arrst_name)
  puts 'Маршрут создан.'
rescue RuntimeError => e
  puts e.message
  retry
end

def new_route_text2
  puts '1. Создать ещё один маршрут.'
  puts '0. Выйти в главное меню.'
  print 'Введите номер пункта меню: '
end

def new_route_choice2
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
  print 'Введите номер маршрута (Формат номера: XXX): '
  gets.chomp
end

def ask_depst_name
  print 'Введите название станции отправления (не менее пяти символов): '
  dep_st_name = gets.chomp
  Station.find(dep_st_name)
end

def ask_arrst_name
  print 'Введите название станции прибытия (не менее пяти символов): '
  arr_st_name = gets.chomp
  Station.find(arr_st_name)
end

def list_menu
  list_menu_text
  list_menu_choice
end

def list_menu_text
  puts ''
  puts '--Меню вывода сведений о железной дороге--'
  puts '1. Вывести список станций.'
  puts '2. Вывести список поездов.'
  puts '0. Вернуться в главное меню.'
  print 'Введите номер пункта меню: '
end

def list_menu_choice
  choice = gets.chomp.to_i
  case choice
  when 1
    stations_list
  when 2
    trains_list
  when 0
    main_menu
  else
    wrong_menu_choice
    main_menu
  end
end

def stations_list
  puts ''
  puts '--Список станций--'
  Station.all.each do |station|
    puts ''
    puts station.name.to_s
    puts 'Поезда на станции:'
    station.trains_to_block do |train|
      puts "Поезд №#{train.number}, #{train.type}, #{train.wagons_amount} вагонов."
    end
  end
  list_menu
end

def trains_list
  puts ''
  puts '--Список поездов--'
  Train.all.each do |train|
    trains_list_text(train)
    trains_list_pass_train(train) if train.class == PassengerTrain
    trains_list_cargo_train(train) if train.class == CargoTrain
  end
  list_menu
end

def trains_list_text(train)
  puts ''
  puts "Поезд №#{train.number}, #{train.type}:"
  puts 'Вагоны в составе поезда:'
end

def trains_list_pass_train(train)
  train.wagons_to_block_with_index do |wagon, index|
    puts "Вагон №#{wagon.number}, #{wagon.type}, номер в составе поезда #{index}:
    мест занято #{wagon.taken?}, мест свободно #{wagon.free?}."
  end
end

def trains_list_cargo_train(train)
  train.wagons_to_block_with_index do |wagon, index|
    puts "Вагон №#{wagon.number}, #{wagon.type}, номер в составе поезда #{index}:
    загружено #{wagon.loaded?}, свободно #{wagon.free?}."
  end
end

def wrong_menu_choice
  puts ''
  puts 'Неправильный номер пункта меню!!!!!'
end

start
