class ChangeColFieldsBattery < ActiveRecord::Migration
  def up
      change_column :battery_weekly_tests, :cell_voltage, :float
      change_column :users, :cell_no, :string, :limit => 17
      change_column :battery_daily_tests, :total_voltage, :float
  end

  def down
      change_column :battery_weekly_tests, :cell_voltage, :text
      change_column :users, :cell_no, :integer
      change_column :battery_daily_tests, :total_voltage, :string
  end
end
