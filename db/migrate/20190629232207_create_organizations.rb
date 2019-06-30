class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :org_type
      t.string :readable_ids
      t.string :writable_ids
      t.boolean :is_producer
      t.boolean :is_validator

      t.timestamps
    end
  end
end
