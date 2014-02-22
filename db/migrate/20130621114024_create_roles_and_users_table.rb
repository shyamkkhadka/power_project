class CreateRolesAndUsersTable < ActiveRecord::Migration
  def up
     if connection.tables.include?('roles')
      drop_table :roles
     end
  	create_table :roles do |t|
      t.string :name
      t.timestamps
    end
	
		create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end

  end
 
  def down
		drop_table :roles

		drop_table :roles_users

	end

end
