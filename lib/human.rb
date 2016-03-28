class Human

  attr_reader :name, :move, :score

  def initialize(name:)
    @name = name
    @score = 0
  end

  def play(move)
    @move = move
  end

  def win
    @score += 1
  end

end
