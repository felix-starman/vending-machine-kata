class VendingMachine
  attr_reader :amount_inserted

  VALID_COINS = [
    { value: 25, weight: 5.670, diameter: 24.26,},
    { value: 10, weight: 2.267, diameter: 17.91,},
    { value: 5, weight: 5.000, diameter: 21.21,},
  ]

  def initialize
    @amount_inserted = 0
  end

  def insert_coin(coin)
    if valid_coin? coin
      @amount_inserted += VALID_COINS.select do |vc|
        compare_coin vc, coin
      end[0][:value]
      true
    else
      false
    end
  end

  def valid_coin?(coin)
    VALID_COINS.one? { |vc| compare_coin vc, coin }
  end

  private

  def compare_coin reference, subject_coin
    reference[:weight] == subject_coin.weight && reference[:diameter] == subject_coin.diameter
  end
end