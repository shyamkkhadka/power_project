class RenameTypeToGenTypeGenerator < ActiveRecord::Migration
  def up
		rename_column :generators, :type, :gen_type
		add_column :generators, :remarks, :text 
  end

  def down
		rename_column :generators, :gen_type, :type
		drop_column :generators, :remarks
  end
end
