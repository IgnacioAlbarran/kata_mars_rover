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

  def commands(commands_array)
    commands_array.each do |command|
      move(command) if (command == 'f' || command == 'b')
      turn(command) if (command == 'r' || command == 'l')
    end
  end

  private

  def move(command)
    next_coordinates = @mars.next_coordinates(@point, @dir, command)
    @point = Point.new(next_coordinates[0], next_coordinates[1])
  end

  def turn(orientation)
    if orientation == 'r'
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == dir } + 1) % 4]
    else
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == dir } - 1)]
    end
  end
end