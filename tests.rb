require_relative 'rover'
require_relative 'point'
require_relative 'planet'
require 'byebug'

describe 'rover' do
  it 'exists' do
    rover = Rover.new(1, 1, 'N')
    expect(rover.instance_of?(Rover)).to eq(true)
  end

  it 'has a starting point' do
    rover = Rover.new(1, 1, 'N')
    expect(rover.give_position).to eq([1, 1])
  end

  it 'has a facing direction' do
    rover = Rover.new(1, 1, 'N')
    expect(rover.give_direction).to eq('N')
  end

  it 'moves forwards' do
    rover = Rover.new(1, 1, 'N')
    rover.commands(['f', 'f', 'f'])
    expect(rover.give_position).to eq([1, 4])
  end

  it 'moves backwards' do
    rover = Rover.new(3, 2, 'E')
    rover.commands(['b', 'b'])
    expect(rover.give_position).to eq([1, 2])
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

  it 'overpassing the edges in the north appears in the south' do
    rover = Rover.new(2, 5, 'N')
    rover.commands(['f', 'f'])
    expect(rover.give_position).to eq([2, 2])
  end

  it 'overpassing the edges in the south appears in the north' do
    rover = Rover.new(2, 1, 'S')
    rover.commands(['f','f'])
    expect(rover.give_position).to eq([2, 4])
  end

  it 'when mars rover finds an obstacle stops' do
    rover = Rover.new(1, 4, 'N')
    rover.commands(['f'])
    expect(rover.give_position).to eq([1, 4])
  end
end
