class ChangeColTypeToTextBattWeeklyTest < ActiveRecord::Migration
  def up
		change_column :battery_weekly_tests, :cell_voltage, :text
  end

  def down
				change_column :battery_weekly_tests, :cell_voltage, :string
  end
end
