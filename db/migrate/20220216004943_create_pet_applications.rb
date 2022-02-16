class CreatePetApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_applications do |t|
      t.string :status, default: "3" 
      t.references :pet, foreign_key: true
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
