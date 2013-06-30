class AddInstallationDateRectifier < ActiveRecord::Migration
  def change
		add_column :rectifiers, :installation_date, :date
  end
end
