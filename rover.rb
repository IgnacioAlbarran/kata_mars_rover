class Rover
  attr_accessor :dir

  def initialize(x, y, direction)
    @point = Point.new(x, y)
    @mars = Planet.new
    @dir = direction
    @last_point = nil
  end

  DIRECTIONS = ['N', 'E', 'S', 'W']

  def give_position
    @point.get_position
  end

  def give_direction
    @dir
  end

  def get_direction
    @dir
  end

  def commands(commands_array)
    save_last_point

    commands_array.each do |command|
      move(command) if (command == 'f' || command == 'b')
      turn(command) if (command == 'r' || command == 'l')
    end
  end

  private

  def move(command)
    next_coordinates = nil
    next_coordinates = @point.x, @point.y + 1 if (@dir == 'N' && command == 'f') || (@dir == 'S' && command == 'b')
    next_coordinates = @point.x, @point.y - 1 if (@dir == 'S' && command == 'f') || (@dir == 'N' && command == 'b')
    next_coordinates = @point.x + 1, @point.y if (@dir == 'E' && command == 'f') || (@dir == 'W' && command == 'b')
    next_coordinates = @point.x - 1, @point.y if (@dir == 'W' && command == 'f') || (@dir == 'E' && command == 'b')

    obstacle?(next_coordinates) && 'STOPPED: There is an obstacle!!' && return
    @point = Point.new(next_coordinates[0],next_coordinates[1])
    check_map
  end

  def turn(orientation)
    if orientation == 'r'
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == dir } + 1) % 4]
    else
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == dir } - 1)]
    end
  end

  def check_map
    @point.x = @mars.planet[:x].to_a[(@point.x - 1) % 5]
    @point.y = @mars.planet[:y].to_a[(@point.y - 1) % 5]
  end

  def obstacle?(coordinates)
    @mars.obstacles.include?(coordinates)
  end

  def save_last_point
    @last_point = give_position
  end

  def x
    self.x
  end
end