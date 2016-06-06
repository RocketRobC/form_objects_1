class CreateCoffeeTypes < ActiveRecord::Migration
  def change
    create_table :coffee_types do |t|
      t.string :name
      t.text :recipe

      t.timestamps null: false
    end
  end
end
