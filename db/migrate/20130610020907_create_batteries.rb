class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.integer :system_type_id
      t.string :company_name
      t.integer :bank_no
      t.integer :capacity
      t.date :installation_date
      t.date :fist_installation_date
      t.string :installation_team
      t.text :remarks
      t.integer :station_id

      t.timestamps
    end
  end
end
