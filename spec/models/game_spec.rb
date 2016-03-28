RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

require 'game'

describe Game do
  let(:player1){double :Player, name: "Me", move: nil}
  let(:player2){double :Player, name: "You", move: nil}

  let(:round_class){ double :Round, new: round}
  let(:round){ double :round}
  let(:game_class) { described_class }
  subject(:game){ described_class.new}



  context 'class methods' do
    describe '#create' do
      it 'stores the game in class instance variable @game' do
        game_class.create(round_class: round_class)
        expect(game_class.instance).to be_instance_of described_class
      end

      it 'stores round_class in class instance variable @round_class' do
        game_class.create(round_class: round_class)
        expect(game_class.round_class).to eq round_class
      end

      it 'stores number_of_players in class instance variable @num_players' do
        game_class.create(round_class: round_class, num_players: 2)
        expect(game_class.num_players).to eq 2
      end

    end
  end

  context 'instance methods' do

    describe '#initialize' do
      it 'expects @players to be an empty array' do
        expect(game.players).to eq []
      end
    end

    describe '#add player' do
      it 'stores the player object in the last position of array @players' do
        game.add_player(player1)
        expect(game.players.last). to eq player1
      end
    end

    describe '#new_round' do
      it 'creates a new round object' do
        expect(round_class).to receive(:new).with(player1: player1, player2: player2)
        game_class.create(round_class: round_class, num_players: 2)
        game_class.instance.add_player(player1)
        game_class.instance.add_player(player2)
        game_class.instance.new_round

      end
    end
  end
end
