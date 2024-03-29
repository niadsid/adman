Adman::Application.routes.draw do

  root :to => 'pages#home'

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  match 'addresses/data', :to => 'addresses#data'
  match 'addresses/dbaction', :to => 'addresses#dbaction'
  match 'networks/data', :to => 'networks#data'
  match 'networks/tree', :to => 'networks#tree'
  match 'networks/dbaction', :to => 'networks#dbaction'
  match 'sites/data', :to => 'sites#data'
  match 'sites/dbaction', :to => 'sites#dbaction'
  
  match 'subnets/data', :to => 'subnets#data'
  match 'subnets/dbaction', :to => 'subnets#dbaction'
  
  match 'address_ranges/data', :to => 'address_ranges#data'
  match 'address_ranges/dbaction', :to => 'address_ranges#dbaction'
  
  match 'domain_names/data', :to => 'domain_names#data'
  match 'domain_names/dbaction', :to => 'domain_names#dbaction'
  
  match 'interfaces/data', :to => 'interfaces#data'
  match 'interfaces/dbaction', :to => 'interfaces#dbaction'
  
  match 'systems/data', :to => 'systems#data'
  match 'systems/dbaction', :to => 'systems#dbaction'

  resources :domain_mappings

  resources :systems

  resources :interfaces

  resources :address_ranges

  resources :addresses

  resources :domain_names

  resources :subnets

  resources :sites

  resources :networks

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
