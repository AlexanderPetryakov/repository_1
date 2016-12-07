require_relative 'Station'
require_relative 'Train'
require_relative 'PassengerTrain'
require_relative 'CargoTrain'
require_relative 'Route'
require_relative 'Wagon'
require_relative 'Coach'
require_relative 'CargoWagon'


def start
	puts ""
  puts "--Система управления железной дорогой--"
  main_menu
end

def main_menu
  puts ""
  puts "--Главное меню--"
  puts "1. Создать новую станцию."
  puts "2. Создать новый поезд."
  puts "3. Редактировать существующий поезд"
  #puts "4. Cоздать новый маршрут."
  puts "4. Просмотр списка станций и поездов."
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
  
  when 3
    #puts 3
    edit_train_menu
    
  #when 4
    #puts 4
  #  new_route
  when 4
    #puts 5
    list_menu
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
    puts e.message
    retry
  end

  puts ""
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
      puts e.message
      retry
    end
    
  when 2
    begin
      CargoTrain.new(ask_train_number)
      puts "Грузовой поезд создан."
    rescue RuntimeError => e
      puts e.message
      retry
    end
    
  when 0
    main_menu
  else
    wrong_menu_choice
    new_train
  end  

  puts ""
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

def edit_train_menu
  puts ""
  puts "--Меню редактирования поездов--"
  puts "1. Добавить вагоны к поезду и загрузить поезд."
  puts "2. Поместить поезд на станцию."
  puts "0. Выйти в главное меню."
  print "Введите номер пункта меню: "
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
  if train == nil
    no_train
  else
    if train.get_wagons_amount > 0
      puts ""
      puts "К поезду №#{train.number} уже были прицеплены вагоны."
      edit_train_menu
    else
      print "Введите количество вагонов, которое Вы хотите прицепить: "
      amount = gets.chomp.to_i
      if train.class == PassengerTrain
        amount.times do
          train.add_wagon(Coach.new(36))
        end
        load_train(train)
      else 
        amount.times do
          train.add_wagon(CargoWagon.new(72))
        end
        load_train(train)
      end
    end
  end
  edit_train_menu
end

def no_train
  puts ""
  puts "Поезда с таким номером не существует."
end

def no_station
  puts ""
  puts "Станции с таким названием не существует."
end

def load_train(train)
  train.wagons_to_block{|wagon| wagon.load(Random.rand(wagon.curr_capacity?))}
  puts ""
  puts "К поезду №#{train.number} прицеплены вагоны, вагоны загружены."
end

def train_to_station
  train = Train.find(ask_train_number)
  if train == nil
    no_train
    edit_train_menu
  else
    station = ask_arrSt_name
    if station == nil
      no_station
      edit_train_menu
    else
      station.train_arrival(train)
    end
  end
  puts ""
  puts "Поезд №#{train.number} прибыл на станцию #{station.name}."
  main_menu
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
  depSt = Station.find(depStName)   
end

def ask_arrSt_name
  print "Введите название станции прибытия (не менее пяти символов): "
  arrStName = gets.chomp
  arrSt = Station.find(arrStName)
end


def list_menu
  puts ""
  puts "--Меню вывода сведений о железной дороге--"
  puts "1. Вывести список станций."
  puts "2. Вывести список поездов."
  puts "0. Вернуться в главное меню."
  print "Введите номер пункта меню: "
  choice = gets.chomp.to_i

    case choice
    when 1
      stations_list
    when 2
      #puts 2
      trains_list
    when 0
      main_menu
    else
      wrong_menu_choice
      main_menu
    end
  
end

def stations_list
  #blockSt = proc {|train| puts "Поезд №#{train.number}, #{train.type}, #{train.get_wagons_amount} вагонов."}
  
  puts ""
  puts "--Список станций--"
  Station.all.each do |station| 
    puts ""
    puts "#{station.name}"
    puts "Поезда на станции:"
    station.trains_to_block{|train| puts "Поезд №#{train.number}, #{train.type}, #{train.get_wagons_amount} вагонов."}
  end
  list_menu
end

def trains_list
 # blockPT = proc {|wagon, index| puts "Вагон №#{wagon.number}, #{wagon.type}, номер в составе поезда #{index}: мест занято #{wagon.taken?}, мест свободно #{wagon.free?}."}
 # blockCT = proc {|wagon, index| puts "Вагон №#{wagon.number}, #{wagon.type}, номер в составе поезда #{index}: загружено #{wagon.loaded?}, свободно #{wagon.free?}."}

  puts ""
  puts "--Список поездов--"
  Train.all.each  do |train|
    puts ""
    puts "Поезд №#{train.number}, #{train.type}:"
    puts "Вагоны в составе поезда:"
    train.wagons_to_block_with_index{|wagon, index| puts "Вагон №#{wagon.number}, #{wagon.type}, номер в составе поезда #{index}: мест занято #{wagon.taken?}, мест свободно #{wagon.free?}."} if train.class == PassengerTrain
    train.wagons_to_block_with_index{|wagon, index| puts "Вагон №#{wagon.number}, #{wagon.type}, номер в составе поезда #{index}: загружено #{wagon.loaded?}, свободно #{wagon.free?}."} if train.class == CargoTrain
  end
  list_menu
end


#  puts ""
#  puts "Список поездов."
#  Train.all.each  { |train| puts "Поезд №#{train.number}, #{train.type}."}
#  puts ""
#  puts "Список маршрутов."
#  Route.all.each  do |route|
#    puts "Маршрут №#{route.number}."
#    route.get_stations_list
#    puts ""
#  print "Чтобы перейти в главное меню нажмите Enter."
#  gets.chomp
#  main_menu

def wrong_menu_choice
  puts ""
  puts "Неправильный номер пункта меню!!!!!"
end

start

#blockPT = proc {|wagon, index| puts "Вагон №#{wagon.number}, в составе поезда №#{index}: мест занято #{wagon.taken?}, мест свободно #{wagon.free?}"}
#blockCT = proc {|wagon, index| puts "Вагон №#{wagon.number}, в составе поезда №#{index}: загружено #{wagon.loaded?}, свободно #{wagon.free?}"}