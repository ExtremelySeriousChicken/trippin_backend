Rails.application.routes.draw do
  #user controllsers
  post '/users/' => 'user#create'
  get  '/users/' => 'user#get'
  get '/users/:id/trips/' => 'user#get_trips'
  
  #get the stuff
  post '/trips/' => 'trip#create'
  get  '/trips/' => 'trip#get'
  get  'trips/find'  => 'trip#find'
  put '/trips/' => 'trip#put'

  post '/trips/:trip_id/participants/' => 'trip#add_participants'
  get  '/trips/:trip_id/participants/' => 'trip#get_participants'

  post '/trips/:trip_id/expenses/'      => 'trip#post_expenses'
  get  '/trips/:trip_id/expenses/'      => 'trip#get_expenses'

  post '/trips/:trip_id/events/'        => 'trip#post_events'
  get  '/trips/:trip_id/events/'        => 'trip#get_events'

  post '/trips/:trip_id/packings/'      => 'trip#post_packings'
  get  '/trips/:trip_id/packings/'      => 'trip#get_packings'

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
