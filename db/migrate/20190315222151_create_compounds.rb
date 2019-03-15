class CreateCompounds < ActiveRecord::Migration[5.1]
  def change
    create_table :compounds do |t|
      t.integer :patient_id

      t.timestamps
    end
  end
end
