require 'constants'

class Round

  attr_reader :player1, :player2

  def initialize (player1:, player2:)
    @player1 = player1
    @player2 = player2
  end

  def find_winner
    return player1 if moves[player1.move].include?(player2.move)
    return player2 if moves[player2.move].include?(player1.move)
  end

  private

  def moves
    move_hash={}
    Constants::MOVES.each{|k,v| move_hash[k]= v.flatten.map!(&:keys).flatten}
    move_hash
  end
end
