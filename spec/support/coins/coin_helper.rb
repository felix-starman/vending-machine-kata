class CoinHelper
  attr_reader :weight, :diameter

  def initialize(**args)
    @weight = args.fetch :weight
    @diameter = args.fetch :diameter
  end
end
