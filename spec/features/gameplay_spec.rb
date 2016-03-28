require 'game'
require 'human'
require 'round'
require 'ai'


RSpec.feature "Game Play:", :type => :feature do

  scenario 'two player game' do

    Game.create(num_players: 2)
    game = Game.instance

    player1 = Human.new(name: 'player1')
    player2 = Human.new(name: 'player2')

    game.add_player(player1)
    game.add_player(player2)

    player1.play(:rock)
    player2.play(:paper)

    puts game.new_round.winner
  end

  scenario 'one player game' do

    Game.create(num_players: 1)
    game = Game.instance

    player1 = Human.new(name: 'player1')
    player2 = Ai.new(name: 'computer')

    game.add_player(player1)
    game.add_player(player2)

    player1.play(:rock)
    player2.play

    p player1.move
    p player2.move

    puts game.new_round.winner
  end


end
