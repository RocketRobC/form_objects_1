class CreateCoffeeNotes < ActiveRecord::Migration
  def change
    create_table :coffee_notes do |t|
      t.datetime :date
      t.string :type
      t.integer :rating
      t.text :notes

      t.timestamps null: false
    end
  end
end
