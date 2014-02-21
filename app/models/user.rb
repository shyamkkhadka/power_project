class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :station_ids, :full_name,
									:emp_id, :designation, :working_office, :cell_no

	validates_presence_of :emp_id, :full_name
	validates_uniqueness_of :emp_id, :cell_no

	has_and_belongs_to_many :roles	
	has_and_belongs_to_many :stations	

	
	def role?(role)
		return !!self.roles.find_by_name(role.to_s)
  end

	
	def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

  HUMANIZED_ATTRIBUTES = {
      :emp_id => "Employee ID",
   }

   def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end

end
