class Planet
  attr_reader :planet, :obstacles

  def initialize
    @planet = {
      'x': 1..5,
      'y': 1..5
    }
    @obstacles = [[1, 5], [2, 3], [3, 4]]
  end
end