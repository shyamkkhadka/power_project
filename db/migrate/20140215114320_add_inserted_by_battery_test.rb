class AddInsertedByBatteryTest < ActiveRecord::Migration
  def up
    add_column :battery_daily_tests, :inserted_by, :string
    add_column :battery_weekly_tests, :inserted_by, :string
    add_column :banks, :inserted_by, :string

  end

  def down
    remove_column :battery_daily_tests, :inserted_by
    remove_column :battery_weekly_tests, :inserted_by
    remove_column :banks, :inserted_by

  end

end