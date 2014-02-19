class AddColumnEquipmentableIdTypeEquipment < ActiveRecord::Migration
  def up
		add_column :equipment, :equipmentable_id, :integer
		add_column :equipment, :equipmentable_type, :string
  end

  def down 
		remove_column :equipment, :equipmentable_id
		remove_column :equipment, :equipmentable_type
  end
end
