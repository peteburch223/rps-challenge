require 'human'

describe Human do

  let(:name){ "Player" }
  subject(:player){ described_class.new(name: name) }

  let(:selected_move){double :Move}

  describe '#initialize' do
    it { expect(player.name).to eq name}
    it { expect(player.score).to eq 0}
  end

  describe '#move' do
    before do
      player.play(selected_move)
    end
    it { expect(player.move).to eq selected_move }
  end

  describe '#win' do
    it { expect{player.win}.to change{player.score}.by 1}
  end

end
