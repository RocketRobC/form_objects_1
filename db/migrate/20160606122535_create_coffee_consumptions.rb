class CreateCoffeeConsumptions < ActiveRecord::Migration
  def change
    create_table :coffee_consumptions do |t|
      t.datetime :date
      t.integer :caffine_in_mg
      t.references :coffee_type, index: true, foreign_key: true
      t.integer :size

      t.timestamps null: false
    end
  end
end
