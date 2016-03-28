require_relative 'round'


class Game

  attr_reader :players

  def self.create(round_class=Round)
    @game = self.new
    @round_class = round_class
  end

  def self.game
    @game
  end

  def self.round_class
    @round_class
  end

  def initialize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def new_round
    self.class.round_class.new(player1: players.first, player2: players.last)
  end

end
