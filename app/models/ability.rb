class Ability
  include CanCan::Ability

  def initialize(user)

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
	
		user ||= User.new # guest user
 	  if user.role? :admin
			can :manage, :all
      can :see_timestamps, User
		elsif user.role? :station_user
      can :read, Station, :users => { :id => user.id }
      # can [:read, :create], Battery, :station => { :users => {:id => user.id} }
      can :manage, Battery
      can :read, BatteryModel
      can :read, AccountingOffice

      
    # # Manage all batterys associated to this station
    # stations = user.stations
    # managed_batteries = []
  # stations.each do |st|
    # st.batteries.each do |bt|
      # managed_batteries << bt.id
    # end
    # managed_batteries << st.id
  # end
  # can :read, Battery, :id => managed_batteries
#       
			puts " I am station2 user, with user #{user.full_name}"     
		elsif user.role? :normal
			puts " I am normal user"    
      can :see_timestamps, User, :id => user.id
    end
  
	end

end
