require_relative 'rover'
require_relative 'point'
require_relative 'planet'
require 'byebug'

describe 'rover' do
  it 'exists' do
    rover = Rover.new(0, 0, 'N')

    expect(rover.instance_of?(Rover)).to eq(true)
  end

  it 'has a starting point' do
    rover = Rover.new(0, 0, 'N')

    expect(rover.give_position).to eq([0, 0])
  end

  it 'has a facing direction' do
    rover = Rover.new(0, 0, 'N')

    expect(rover.give_direction).to eq('N')
  end

  it 'moves forwards' do
    rover = Rover.new(0, 0, 'N')
    rover.commands(['f', 'f', 'f'])
    expect(rover.give_position).to eq([0, 3])
  end

  it 'moves backwards' do
    rover = Rover.new(2, 2, 'E')
    rover.commands(['b', 'b'])
    expect(rover.give_position).to eq([0, 2])
  end

  it 'turns right' do
    rover = Rover.new(0, 0, 'E')

    rover.commands(['r', 'r'])
    expect(rover.give_direction).to eq('W')
  end

  it 'turns left' do
    rover = Rover.new(0, 0, 'E')
    rover.commands(['l', 'l'])
    expect(rover.give_direction).to eq('W')
  end

  xit 'can move along the map overpassing the edges' do
    rover = Rover.new(2, 4, 'N')
    rover.commands(['f','f'])
    expect(rover.give_position).to eq([2, 1])
  end
end

=begin

Requirements
-You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
-The rover receives a character array of commands.
-Implement commands that move the rover forward/backward (f,b).
-Implement commands that turn the rover left/right (l,r).
-Implement wrapping at edges. But be careful, planets are spheres. Connect the x edge to the other x edge, so (1,1) for x-1 to (5,1), but connect vertical edges towards themselves in inverted coordinates, so (1,1) for y-1 connects to (5,1).
-Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point, aborts the sequence and reports the obstacle.rescue => exception

=end