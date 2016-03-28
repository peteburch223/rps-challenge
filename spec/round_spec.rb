require 'round'

describe Round do

  let(:player1){double :Player, name: "Me", move: nil}
  let(:player2){double :Player, name: "You", move: nil}

  subject(:round){described_class.new(player1: player1, player2: player2)}

  describe '#find winner' do
    it 'returns player1 when he plays winning move' do
      allow(player1).to receive(:move).and_return(:paper)
      allow(player2).to receive(:move).and_return(:rock)
      expect(subject.find_winner).to eq player1
    end

    it 'returns player2 when he plays winning move' do
      allow(player1).to receive(:move).and_return(:rock)
      allow(player2).to receive(:move).and_return(:paper)
      expect(subject.find_winner).to eq player2
    end

    it 'returns nil when players play same move'  do
      allow(player1).to receive(:move).and_return(:paper)
      allow(player2).to receive(:move).and_return(:paper)
      expect(subject.find_winner).to eq nil
    end
  end
end
