module ApplicationHelper

  def coffee_sizes
    CoffeeConsumption.sizes.keys.map { |s| [s.titleize, s] }
  end

  def coffee_size(object)
    object.coffee_consumption.size.titleize if object.coffee_consumption
  end

  def coffee_type_selection
    CoffeeType.all.map { |ct| [ct.name, ct.id] }
  end

  def format_date(time)
    time.strftime('%A %d %B %Y')
  end
end
