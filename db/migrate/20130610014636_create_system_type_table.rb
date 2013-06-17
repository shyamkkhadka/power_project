class CreateSystemTypeTable < ActiveRecord::Migration
  def up
    create_table :system_type do |t|
      t.string :name
    end
  end

  def down
   drop_table :system_type  
  end

end
