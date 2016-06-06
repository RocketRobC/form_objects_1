class AddCoffeeConsumptionToCoffeeNote < ActiveRecord::Migration
  def change
    add_reference :coffee_notes, :coffee_consumption, index: true, foreign_key: true
  end
end
