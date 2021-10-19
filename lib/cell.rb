class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_hit_on = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_instance)
    @ship = ship_instance
  end

  def fired_upon?
    @cell_hit_on
  end

  def fire_upon
    if empty? == false && fired_upon? == false
      @ship.hit
    end
    @cell_hit_on = true
  end

  def render(ship_show = false)
    if @cell_hit_on == false && !@ship
      "."
    elsif @cell_hit_on == true && !@ship
      "M"
    elsif @cell_hit_on == false && @ship && ship_show == true
      "S"
    end
  end
end
