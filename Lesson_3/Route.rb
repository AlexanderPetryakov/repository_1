class Route

  def initialize(from, to)
    @to = to
    @stations_list = []
    @stations_list << from
    @stations_list << to
  end

  def add_station(station)
    @stations_list[-1] = station
    @stations_list << @to
  end

  def delete_station(station)
    @stations_list.delete(station)
  end

  def get_stations_list
    @stations_list.each {|station| puts station.get_name}
  end

  def get_stations
    @stations_list
  end

end
