class Planet
  attr_reader :planet, :obstacles

  def initialize
    @planet = {
      'x': 1..5,
      'y': 1..5
    }
    @obstacles = [[1, 5], [2, 3], [3, 4]]
  end

  def next_point(point, dir, command)
    return check_map(point.x, point.y + 1, point) if (dir == 'N' && command == 'f') || (dir == 'S' && command == 'b')
    return check_map(point.x, point.y - 1, point) if (dir == 'S' && command == 'f') || (dir == 'N' && command == 'b')
    return check_map(point.x + 1, point.y, point) if (dir == 'E' && command == 'f') || (dir == 'W' && command == 'b')
    return check_map(point.x - 1, point.y, point) if (dir == 'W' && command == 'f') || (dir == 'E' && command == 'b')
  end

  def check_map(possible_x, possible_y, point)
    return point if obstacle?(possible_x, possible_y)
    check_borders(possible_x, possible_y)
  end

  def check_borders(possible_x, possible_y)
    x = planet[:x].to_a[(possible_x - 1) % 5]
    y = planet[:y].to_a[(possible_y - 1) % 5]
    Point.new(x, y)
  end

  def obstacle?(x, y)
    obstacles.include?([x, y])
  end
end