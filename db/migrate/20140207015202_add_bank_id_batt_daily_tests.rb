class AddBankIdBattDailyTests < ActiveRecord::Migration
  def up
		add_column :battery_daily_tests, :bank_id, :integer
		rename_column :banks, :visual_inpsection, :visual_inspection
  end

  def down
		remove_column :battery_daily_tests, :bank_id
		rename_column :banks, :visual_inspection, :visual_inpsection
  end
end
