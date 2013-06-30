class RenameAccOfficeIdStation < ActiveRecord::Migration
  def up
		rename_column :stations, :acc_office_id, :accounting_office_id
  end

  def down
		rename_column :stations, :accounting_office_id, :acc_office_id
  end
end
