class Rover
  def initialize
    @point = Point.new
  end

  def give_position
    @point.get_position
  end
end