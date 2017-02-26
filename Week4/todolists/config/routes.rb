Rails.application.routes.draw do

  # Make the todo_list#index action the root of the application
  root to: "todo_lists#index"

  #Access :todo_list resources at URI /todo_lists
  resources :todo_lists do
  # Access :todo_item resources at URI /todo_lists/:todo_list_id/todo_items
    resources :todo_items
  end
  
  # Create a new controller to manage the user's session when interacting with the server.
    resources :sessions, only: [:new, :create, :destroy] 

  # Map the GET /login action to sessions#new in config/routes.rb. Have this be referred to as the login resource so rake routes generates a login_path helper.
  get "/login" => "sessions#new", as: "login"

  # Map the DELETE /login action to sessions#destroy in config/routes.rb. Have this referred to as the logout resource so rake routes reports a logout_path helper.
  delete "/logout" => "sessions#destroy", as: "logout"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#verbsiew'

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
