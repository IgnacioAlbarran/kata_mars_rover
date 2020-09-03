class Planet
  attr_reader :planet

  def initialize
    @planet = {
      'x': 1..5,
      'y': 1..5
    }
  end
end