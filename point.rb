require_relative 'rover'

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def get_position
    [@x, @y]
  end
end