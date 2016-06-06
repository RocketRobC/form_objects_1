class CoffeeType < ActiveRecord::Base
  has_many :coffee_consumptions
  has_many :coffee_notes

end
