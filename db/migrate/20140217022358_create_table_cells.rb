class CreateTableCells < ActiveRecord::Migration
  def up
    create_table :cells do |t|
      t.float :cell_voltage
      t.string :visual_inspection
      t.integer :bank_id
      t.timestamps
    end
    remove_column :banks, :cells 
  end

  def down
    drop_table :cells
    add_column :cells, :text
  end
end
