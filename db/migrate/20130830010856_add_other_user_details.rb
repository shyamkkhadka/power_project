class AddOtherUserDetails < ActiveRecord::Migration
  def up
		add_column :users, :emp_id, :integer
		add_column :users, :designation, :string
		add_column :users, :working_office, :string
		add_column :users, :cell_no, :integer
		remove_column :equipment, :code
  end

  def down
		remove_column :users, :emp_id
		remove_column :users, :designation
		remove_column :users, :working_office
		remove_column :users, :cell_no
		add_column :equipment, :code, :string
  end
end
