describe VendingMachine do
  let(:quarter) { CoinHelper.new weight: 5.670, diameter: 24.26 }
  let(:dime)    { CoinHelper.new weight: 2.267, diameter: 17.91 }
  let(:nickel)  { CoinHelper.new weight: 5.000, diameter: 21.21 }
  let(:penny)   { CoinHelper.new weight: 2.500, diameter: 19.05 }

  subject { described_class.new }

  describe '#valid_coin?' do
    [:quarter, :dime, :nickel].each do |coin|
      it "returns true for a #{coin}" do
        expect(subject.valid_coin?(public_send(coin))).to eq true
      end
    end

    it 'returns false for a penny' do
      expect(subject.valid_coin?(penny)).to eq false
    end
  end

  describe '#insert_coin' do
    let(:coin) { nil }
    let(:vending_machine) { described_class.new }

    subject { vending_machine.insert_coin coin }

    context 'with a valid coin' do
      let(:coin) { quarter }

      it { is_expected.to eq true }

      it 'increases the amount_inserted' do
        expect { subject }.to change { vending_machine.amount_inserted }.by(25)
      end
    end

    context 'with an invalid coin' do
      let(:coin) { penny }

      it { is_expected.to eq false }

      it 'does not increase the amount_inserted' do
        expect { subject }.not_to change { vending_machine.amount_inserted }
      end

      it 'sends the coin to the coin return' do
        expect { subject }.to change { vending_machine.coin_return }.from([])
          .to([coin])
      end
    end
  end
end
