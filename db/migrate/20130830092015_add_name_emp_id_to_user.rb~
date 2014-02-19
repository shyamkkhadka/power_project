class AddNameEmpIdToUser < ActiveRecord::Migration
  def change
		add_column :users, :name_emp_id, :string
  end
end

User.all.each do |u|  
u.name_emp_id = u.full_name + '-' + u.emp_id.to_s 
u.save 
end

