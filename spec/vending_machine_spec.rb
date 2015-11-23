describe VendingMachine do
  let(:quarter) { CoinHelper.new weight: 5.670, diameter: 24.26 }
  let(:dime)    { CoinHelper.new weight: 2.267, diameter: 17.91 }
  let(:nickel)  { CoinHelper.new weight: 5.000, diameter: 21.21 }
  let(:penny)   { CoinHelper.new weight: 2.500, diameter: 19.05 }

  subject { described_class.new() }

  describe '#valid_coin?' do
    [:quarter, :dime, :nickel].each do |coin|
      it "returns true for a #{coin}" do
        expect(subject.valid_coin?(public_send coin)).to eq true
      end
    end

    it 'returns false for a penny' do
      expect(subject.valid_coin? penny).to eq false
    end
  end
end