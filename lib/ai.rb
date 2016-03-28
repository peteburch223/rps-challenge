require_relative 'constants'

class Ai

  include Constants

  attr_reader :name, :move

  def initialize(name: )
      @name = name
  end

  def play(*)
    moves = Constants::MOVES.keys
    @move = moves[Kernel.rand(moves.count)]
  end
end
