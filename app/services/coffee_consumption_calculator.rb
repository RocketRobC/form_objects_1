module CoffeeConsumptionCalculator

  CAFFINE_BASE = 77

  COFFEE_SIZE = {
    'half' => 0.5,
    'single' => 1,
    'double' => 2,
    'triple' => 3
  }

  def self.valid?(size)
    COFFEE_SIZE.keys.include?(size)
  end

  def self.calculate_caffine(size)
    return false unless valid?(size)
    COFFEE_SIZE[size] * CAFFINE_BASE
  end

end
