RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

require 'ai'

describe Ai do

  subject(:ai){ described_class.new }

  describe '#initialize' do
    it { expect(ai.name).to eq Ai::NAME}
  end

  before do
    srand 1234
  end

  describe '#move' do
    it { expect(ai.move).to eq Constants::MOVES[1] }
    it { rand(2); expect(ai.move).to eq Constants::MOVES[1] }
    it { rand(2); rand(2); expect(ai.move).to eq Constants::MOVES[0] }
    it { rand(2); rand(2); rand(2); expect(ai.move).to eq Constants::MOVES[1] }
  end
end