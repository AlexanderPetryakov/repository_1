class Route

  def initialize(from, to)
    @stations_list = [from,to]
  end

  def add_station(station)
    @stations_list.insert(-2, station)
  end

  def delete_station(station)
    @stations_list.delete(station)
  end

  def get_stations_list
    @stations_list.each {|station| puts station.name}
  end

  def get_stations
    @stations_list
  end

end
