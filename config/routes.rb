PowerProject::Application.routes.draw do

  


  resources :battery_models


 resources :accounting_offices


 resources :stations do
	  resources :batteries 
	  resources :rectifiers
		resources :generators
		
		collection do
			get 'list'			
		end
end

 resources :batteries do 
    get 'daily_report_list'
    get 'weekly_report_list'
        
    resources :battery_daily_tests do 
      post 'reports', :on => :collection
    end
	  resources :battery_weekly_tests do
			get 'jqgrid', :on => :collection 
			post 'reports', :on => :collection
		end
		resources :banks do
			post 'update_cell'	
		end
		
 end


  #devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }
	
	# Newly added 	
	devise_for :users, :controllers => { :registrations => "registrations" }
	resources :users

  # Custom route due to jqgrid non RESTful behaviour to allow editing the cell data
  #post 'banks/update/' => 'banks#update'	

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'stations#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'


end
