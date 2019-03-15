class CreatePharmacies < ActiveRecord::Migration[5.1]
  def change
    create_table :pharmacies do |t|
      t.string :address
      t.string :hours
      t.string :rating
      t.string :api_credentials

      t.timestamps
    end
  end
end
