class CoffeeNote < ActiveRecord::Base
  belongs_to :coffee_consumption
  belongs_to :coffee_type

  validates_presence_of :coffee_consumption

end
