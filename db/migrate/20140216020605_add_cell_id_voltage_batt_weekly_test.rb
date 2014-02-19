class AddCellIdVoltageBattWeeklyTest < ActiveRecord::Migration
  def up
    add_column :battery_weekly_tests, :cell_id, :integer
    add_column :battery_weekly_tests, :visual_inspection, :string
  end

  def down
    remove_column :battery_weekly_tests, :cell_id
    remove_column :battery_weekly_tests, :visual_inspection  
  end
end
