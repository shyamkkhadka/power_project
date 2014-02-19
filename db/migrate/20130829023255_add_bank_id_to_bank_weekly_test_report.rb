class AddBankIdToBankWeeklyTestReport < ActiveRecord::Migration
  def change
		add_column :battery_weekly_tests, :bank_id, :integer
  end
end
