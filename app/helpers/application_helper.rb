module ApplicationHelper

  def coffee_sizes
    CoffeeConsumption.sizes.keys.map { |s| [s.titleize, s] }
  end

  def coffee_size(object)
    object.coffee_consumption.size.titleize if object.coffee_consumption
  end
end
