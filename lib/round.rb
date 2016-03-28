require 'constants'

class Round

  def initialize (player1:, player2:)
    @player1 = player1
    @player2 = player2
  end

  def winner
    result = []
    result << check_winner(player1, player2)
    result << check_winner(player2, player1)
    result.flatten!
  end

  private

  attr_reader :player1, :player2

  def moves
    move_hash={}
    Constants::MOVES.each{|k,v| move_hash[k]= v.flatten.map!(&:keys).flatten}
    move_hash
  end

  def check_winner(p1, p2)
    result = []
    if moves[p1.move].include?(p2.move)
      p1.win
      result << p1.name
      result << p1.move.to_s
      result << Constants::MOVES[p1.move].first[p2.move]
      result << p2.move.to_s
    end
    result
  end
end
