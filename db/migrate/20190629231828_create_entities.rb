class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :age
      t.date :dob
      t.string :education_level
      t.string :education_specialization
      t.string :employer
      t.string :place_of_birth
      t.string :current_resident_country

      t.timestamps
    end
  end
end
