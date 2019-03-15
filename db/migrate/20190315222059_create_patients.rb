class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.date :dob
      t.integer :doctor_id

      t.timestamps
    end
  end
end
