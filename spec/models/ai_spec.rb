require 'ai'

describe Ai do

  let(:name){ "Computer" }
  subject(:ai){ described_class.new(name: name) }
  let(:moves){Constants::MOVES.keys}

  describe '#initialize' do
    it { expect(ai.name).to eq name}
    it { expect(ai.score).to eq 0}
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

  describe '#win' do
    it { expect{ai.win}.to change{ai.score}.by 1}
  end
end
