class CoffeeConsumptionCalculator

  CAFFINE_BASE = 77

  COFFEE_SIZE = {
    'half' => 0.5,
    'single' => 1,
    'double' => 2,
    'triple' => 3
  }

  def valid?(size)
   # COFFEE_SIZE.keys.include?(size)
   COFFEE_SIZE.has_key?(size)
  end

  def calculate_caffine(size)
    return false unless valid?(size)
    COFFEE_SIZE[size] * CAFFINE_BASE
  end

end
