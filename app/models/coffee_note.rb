class CoffeeNote < ActiveRecord::Base
  belongs_to :coffee_consumption
  belongs_to :coffee_type

end
