module ApplicationHelper

  def coffee_sizes
    CoffeeConsumption.sizes.keys.map { |s| [s.titleize, s] }
  end

  def coffee_size(object)
    object.coffee_consumption.size.titleize if object.coffee_consumption
  end

  def coffee_type_selection
    CoffeeType.all.map { |ct| [ct.name,
                              ct.id,
                              { 'data-recipe' => ct.recipe }
                              ]
                        }
  end

  def format_date(time)
    time.strftime('%A %d %B %Y')
  end

  def seven_days_ago
    Time.zone.now - 7.days
  end

  def number_of_coffees_last_seven_days
    CoffeeConsumption.last_7_days.count
  end

  def total_coffees_drunk
    CoffeeConsumption.all.count
  end

  def total_caffine_consumed
    CoffeeConsumption.consumed_caffine
  end

  def formatted_total_caffine_consumed
    "#{total_caffine_consumed} mg"
  end

  def caffine_consumed_last_7_days
    CoffeeConsumption.last_7_days.consumed_caffine
  end

  def formatted_caffine_consumed_last_7_days
    "#{caffine_consumed_last_7_days} mg"
  end

end
