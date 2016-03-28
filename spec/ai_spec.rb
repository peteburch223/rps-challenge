require 'ai'

describe Ai do

  let(:name){ "Computer" }
  subject(:ai){ described_class.new(name: name) }
  let(:moves){Constants::MOVES.keys}

  describe '#initialize' do
    it { expect(ai.name).to eq name}
  end

  before do
    srand SEED
    ai.play
  end

  describe '#play' do
    it { expect(ai.move).to eq moves[3] }
    it { ai.play; expect(ai.move).to eq moves[4] }
    it { ai.play; ai.play; expect(ai.move).to eq moves[4] }
    it { ai.play; ai.play; ai.play; expect(ai.move).to eq moves[0] }
  end
end
