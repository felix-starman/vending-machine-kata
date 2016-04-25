class VendingMachine
  attr_reader :amount_inserted, :coin_return

  VALID_COINS = [
    { value: 25, weight: 5.670, diameter: 24.26 },
    { value: 10, weight: 2.267, diameter: 17.91 },
    { value: 5, weight: 5.000, diameter: 21.21 }
  ]

  def initialize
    @amount_inserted = 0
    @coin_return = []
    @inserted_coins = []
  end

  def insert_coin(coin)
    if valid_coin? coin
      @amount_inserted += VALID_COINS.select do |valid|
        compare_coin valid, coin
      end[0][:value]
      true
    else
      @coin_return << coin
      false
    end
  end

  def valid_coin?(coin)
    VALID_COINS.one? { |valid| compare_coin valid, coin }
  end

  private

  def compare_coin(reference, subject_coin)
    reference[:weight] == subject_coin.weight &&
      reference[:diameter] == subject_coin.diameter
  end
end
