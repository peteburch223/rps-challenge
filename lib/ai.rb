require_relative 'constants'

class Ai

  include Constants

  attr_reader :name, :move, :score

  def initialize(name: )
    @name = name
    @score = 0
  end

  def play(*)
    moves = Constants::MOVES.keys
    @move = moves[Kernel.rand(moves.count)]
  end

  def win
    @score += 1
  end
end
