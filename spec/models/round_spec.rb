require 'round'

describe Round do

  let(:player1){double :Player, name: "Me", move: nil, win: nil}
  let(:player2){double :Player, name: "You", move: nil, win: nil}

  subject(:round){described_class.new(player1: player1, player2: player2)}

  describe '#winner' do
    context 'player1 wins' do
      before do
        allow(player1).to receive(:move).and_return(:paper)
        allow(player2).to receive(:move).and_return(:rock)
      end

      it 'returns player1 when he plays winning move' do
        expect(subject.winner.first).to eq player1.name
      end
      it 'sends win to player1' do
        expect(player1).to receive(:win)
        subject.winner
      end
      it 'does not send win to player2' do
        expect(player2).not_to receive(:win)
        subject.winner
      end
    end

    context 'player2 wins' do
      before do
        allow(player1).to receive(:move).and_return(:rock)
        allow(player2).to receive(:move).and_return(:paper)
      end

      it 'returns player2 when he plays winning move' do
        expect(subject.winner.first).to eq player2.name
      end
      it 'sends win to player2' do
        expect(player2).to receive(:win)
        subject.winner
      end
      it 'does not send win to player1' do
        expect(player1).not_to receive(:win)
        subject.winner
      end
    end

    context 'draw' do
      before do
        allow(player1).to receive(:move).and_return(:rock)
        allow(player2).to receive(:move).and_return(:rock)
      end

      it 'returns an empty array' do
        expect(subject.winner).to eq []
      end
      it 'does not send win to player1' do
        expect(player1).not_to receive(:win)
        subject.winner
      end
      it 'does not send win to player2' do
        expect(player2).not_to receive(:win)
        subject.winner
      end
    end


  end
end
