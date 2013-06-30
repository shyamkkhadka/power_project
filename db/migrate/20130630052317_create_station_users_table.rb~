class CreateStationUsersTable < ActiveRecord::Migration
  def up
		create_table :stations_users, :id => false do |t|
    t.references :station, :user
   end

  end

  def down
  end
end
