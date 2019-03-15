class CreateConcentrations < ActiveRecord::Migration[5.1]
  def change
    create_table :concentrations do |t|
      t.integer :compound_id
      t.float :ingredient_concentration
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
