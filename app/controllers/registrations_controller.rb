class RegistrationsController < Devise::RegistrationsController
	
	# Before class Users::RegistrationsController < Devise::RegistrationsController
  #before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication
 
  def check_permissions
    authorize! :create, resource
  end

	def index
		super
	end

	# Modified for change password action
	def edit
		#super
	end

	def update
		super
		# Look for method to set only notice message to display
		#format.html { redirect_to stations_url, notice: 'User was successfully updated.' }
	end

	# Modified for new user add action
	def new
		#super
		# Overwriting /signup method to redirect to users/new 
		 respond_to do |format|
        format.html { redirect_to new_user_path }
      end
	end

	def create
    @user = User.new(params[:user])
 		@user.name_emp_id = @user.full_name + '-' + @user.emp_id.to_s
    if @user.save 
			@user.roles.push(Role.find_by_name(@user.role))
			@user.save

      respond_to do |format|
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to users_path }
      end
    else
      respond_to do |format|
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
        format.xml  { head :ok }
        format.html { render new_user_path, :status => :unprocessable_entity }
      end
    end
	end

end
