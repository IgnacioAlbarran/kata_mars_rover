class Point

  def initialize(x, y, direction)
    @x = x
    @y = y
    @dir = direction
  end

  DIRECTIONS = ['N', 'E', 'S', 'W']

  def get_position
    [@x, @y]
  end

  def get_direction
    @dir
  end

  def move_forward
    case @dir
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'S'
      @y -= 1
    when 'W'
      @x -= 1
    end
  end

  def move_backward
    case @dir
    when 'N'
      @y -= 1
    when 'E'
      @x -= 1
    when 'S'
      @y += 1
    when 'W'
      @x += 1
    end
  end

  def turn(orientation)
    if orientation == :right
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == @dir } + 1) % 4]
    else
      @dir = DIRECTIONS[(DIRECTIONS.index{ |i| i == @dir } - 1)]
    end
  end
end