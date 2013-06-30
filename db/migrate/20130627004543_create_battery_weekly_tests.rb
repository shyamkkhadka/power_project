class CreateBatteryWeeklyTests < ActiveRecord::Migration
  def change
    create_table :battery_weekly_tests do |t|
      t.string :cell_voltage
      t.integer :battery_id

      t.timestamps
    end
  end
end
