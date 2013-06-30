class CreateRectifiers < ActiveRecord::Migration
  def change
    create_table :rectifiers do |t|
      t.integer :system_type_id
      t.string :manufacturer_name
      t.string :serial_no
      t.integer :module_no
      t.integer :total_capacity
      t.date :first_installation_date
      t.string :installation_team
      t.text :remarks
      t.integer :station_id

      t.timestamps
    end
  end
end
