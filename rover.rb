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
      case command
      when 'f'
        move_forward
      when 'b'
        move_backward
      when 'r'
        turn(:right)
      when 'l'
        turn(:left)
      end
    end
  end

  private

  def move_forward
    case dir
    when 'N'
      @point.y += 1
    when 'E'
      @point.x += 1
    when 'S'
      @point.y -= 1
    when 'W'
      @point.x -= 1
    end

    check_map
  end

  def move_backward
    case dir
    when 'N'
      @point.y -= 1
    when 'E'
      @point.x -= 1
    when 'S'
      @point.y += 1
    when 'W'
      @point.x += 1
    end

    check_map
  end

  def turn(orientation)
    if orientation == :right
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == dir } + 1) % 4]
    else
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == dir } - 1)]
    end
  end

  def check_map
    @point.x = @mars.planet[:x].to_a[(@point.x - 1) % 5]
    @point.y = @mars.planet[:y].to_a[(@point.y - 1) % 5]
    stop_move if obstacle?(give_position)
  end

  def stop_move
    @point.x, @point.y = @last_point[0], @last_point[1]
  end

  def obstacle?(coordinates)
    @mars.obstacles.include?(coordinates)
  end

  def save_last_point
    @last_point = give_position
  end
end