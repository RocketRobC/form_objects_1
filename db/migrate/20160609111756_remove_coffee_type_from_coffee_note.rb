class RemoveCoffeeTypeFromCoffeeNote < ActiveRecord::Migration
  def change
    remove_column :coffee_notes, :coffee_type, :string
  end
end
