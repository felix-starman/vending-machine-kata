describe VendingMachine do
  let(:quarter) { CoinHelper.new weight: 5.670, diameter: 24.26 }
  let(:dime)    { CoinHelper.new weight: 2.267, diameter: 17.91 }
  let(:nickel)  { CoinHelper.new weight: 5.000, diameter: 21.21 }
  let(:penny)   { CoinHelper.new weight: 2.500, diameter: 19.05 }

  subject { described_class.new() }

  describe '#valid_coin?' do
    it 'returns true for a quarter' do
      expect(subject.valid_coin? quarter).to eq true
    end

    it 'returns true for a dime' do
      expect(subject.valid_coin? dime).to eq true
    end

    it 'returns true for a nickel' do
      expect(subject.valid_coin? nickel).to eq true
    end

    it 'returns false for a penny' do
      expect(subject.valid_coin? penny).to eq false
    end
  end
end