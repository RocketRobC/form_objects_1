class CoffeeConsumption < ActiveRecord::Base
  belongs_to :coffee_type
  has_one :coffee_note

end
