class CreateFavoriteCompounds < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_compounds do |t|
      t.integer :favorited_by
      t.integer :compound_id

      t.timestamps
    end
  end
end
