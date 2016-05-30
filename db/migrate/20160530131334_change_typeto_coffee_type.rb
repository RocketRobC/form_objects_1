class ChangeTypetoCoffeeType < ActiveRecord::Migration
  def change
    rename_column :coffee_notes, :type, :coffee_type
  end
end
