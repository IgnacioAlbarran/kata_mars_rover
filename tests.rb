require_relative 'rover'
require_relative 'point'
require 'byebug'

describe 'rover' do
  it 'there is a rover' do
    rover = Rover.new

    expect(rover.instance_of?(Rover)).to eq(true)
  end

  it 'rover has a starting point' do
    rover = Rover.new

    expect(rover.give_position).to eq([0, 0])
  end

  xit 'rover has a facing direction' do
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