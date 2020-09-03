class Rover
  def initialize(x, y, direction)
    @point = Point.new(x, y, direction)
    @mars = Planet.new
  end

  def give_position
    @point.get_position
  end

  def give_direction
    @point.get_direction
  end

  def commands(commands_array)
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
    @point.move_forward
  end

  def move_backward
    @point.move_backward
  end

  def turn(direction)
    @point.turn(direction)
  end
end