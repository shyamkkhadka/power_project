class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :total_voltage
      t.text :visual_inpsection
      t.text :cells
      t.integer :battery_id

      t.timestamps
    end
  end
end
