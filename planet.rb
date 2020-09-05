class Planet
  attr_reader :planet, :obstacles

  def initialize
    @planet = {
      'x': 1..5,
      'y': 1..5
    }
    @obstacles = [[1, 5], [2, 3], [3, 4]]
  end

  def next_coordinates(point, dir, command)
    return [point.x, point.y + 1] if (dir == 'N' && command == 'f') || (dir == 'S' && command == 'b')
    return [point.x, point.y - 1] if (dir == 'S' && command == 'f') || (dir == 'N' && command == 'b')
    return [point.x + 1, point.y] if (dir == 'E' && command == 'f') || (dir == 'W' && command == 'b')
    return [point.x - 1, point.y] if (dir == 'W' && command == 'f') || (dir == 'E' && command == 'b')
  end

  def check_map(point)
    point.x = planet[:x].to_a[(point.x - 1) % 5]
    point.y = planet[:y].to_a[(point.y - 1) % 5]
  end

  def obstacle?(coordinates)
    obstacles.include?(coordinates)
  end
end