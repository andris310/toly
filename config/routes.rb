Toly2Store::Application.routes.draw do
  resources :coupons

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :users, :only => [:show]
  resources :orders
  resources :line_items
  resources :carts
  resources :pages

  get "store/index"
  resources :products do
    get :who_bought, on: :member
  end

resources :products do
  member { get :download }
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'pages#home', as: 'home'
   get '/store' => 'store#index'
   get '/about' => 'pages#about'
   get '/contact' => 'pages#contact'
   get '/order-finished' => 'orders#order_finished'
   get '/count_items/:id' => 'carts#count_items'
   # get '/download' => 'products#download_product'

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'

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
