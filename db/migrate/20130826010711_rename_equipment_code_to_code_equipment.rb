class RenameEquipmentCodeToCodeEquipment < ActiveRecord::Migration
  def up
		rename_column :equipment, :equipment_code, :code
  end

  def down
		rename_column :equipment, :code, :equipment_code
  end
end
