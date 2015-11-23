class VendingMachine

  VALID_COINS = [
    { value: 25, weight: 5.670, diameter: 24.26,},
    { value: 10, weight: 2.267, diameter: 17.91,},
    { value: 5, weight: 5.000, diameter: 21.21,},
  ]

  def valid_coin?(coin)
    VALID_COINS.one? do |valid|
      valid[:weight] == coin.weight && valid[:diameter] == coin.diameter
    end
  end
end