Rails.application.routes.draw do
  devise_for :users
  resources :print_price_points
  get 'print_price_points/print_price_history/:print_id' => 'print_price_points#print_price_history', as: :print_price_history

  resources :sales

  resources :purchases

  get 'my_collection' => 'my_collections#index', as: :my_collection
  get 'my_collection/mosaic' => 'my_collections#mosaic', as: :my_mosaic

  resources :transaction_types

  resources :transactions

  resources :print_markings

  resources :print_techniques

  resources :print_statuses

  resources :print_classes

  resources :print_sizes

  resources :artists

  resources :prints

  get 'update_print_values' => 'prints#update_print_values', as: :update_print_values
  get 'update_print_collection' => 'prints#update_print_collection', as: :update_print_collection

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "raksizes
  # You can have the root of your site routed with "root"
  root 'my_collections#index'

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
