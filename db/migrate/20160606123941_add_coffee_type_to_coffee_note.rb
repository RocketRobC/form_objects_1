class AddCoffeeTypeToCoffeeNote < ActiveRecord::Migration
  def change
    add_reference :coffee_notes, :coffee_type, index: true, foreign_key: true
  end
end
