Rails.application.routes.draw do
  root                                  'static_pages#home'
  get    'about'                     => 'static_pages#about'
  get    'contact'                   => 'static_pages#contact'
  get    'faq'                       => 'static_pages#faq'
  get    'guides/mtbachelor'         => 'guides#mtbachelor', as: :mtbachelor
  get    'guides/mthood'             => 'guides#mthood',     as: :mthood
  get    'guides/mtwhistler'         => 'guides#mtwhistler', as: :mtwhistler
  get    'guides/:id/new-reservation' => 'guides#new_reservation', as: :new_reservation
  post   'guides/:id/create-reservation' => 'guides#create_reservation', as: :create_reservation
  get    'users/:id/change-password' => 'users#change_password', as: 'change-password'
  get    'signup'                    => 'users#new'
  get    'guide-creation'            => 'guides#new', as: 'guide-creation'
  get    'login'                     => 'sessions#new'
  post   'login'                     => 'sessions#create'
  delete 'logout'                    => 'sessions#destroy'

  resources :users
  resources :guides

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
