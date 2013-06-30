class CreateBatteryDailyTests < ActiveRecord::Migration
  def change
    create_table :battery_daily_tests do |t|
      t.integer :battery_id
      t.string :total_voltage
      t.text :visual_inspection

      t.timestamps
    end
  end
end
