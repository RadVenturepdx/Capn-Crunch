Rails.application.routes.draw do

  root                                       'static_pages#home'
  get    'home'                           => 'static_pages#home'
  get    'contact'                        => 'messages#new'
  get    'locations'                      => 'static_pages#locations'
  get    'about'                          => 'static_pages#about'
  get    'faq'                            => 'static_pages#faq'
  get    'search'                         => 'static_pages#search'
  post   'search'                         => 'static_pages#search'
  get    'mtbachelor'                     => 'guides#mtbachelor'
  get    'mthood'                         => 'guides#mthood'
  get    'mtwhistler'                     => 'guides#mtwhistler'
  get    'guides/:id/new-reservation'     => 'guides#new_reservation', as: :new_reservation
  get    'guides/:id/payment'             => 'guides#payment', as: :payment
  post   'reservation/:id/create'         => 'reservations#create', as: :create_reservation
  get    'users/:id/change_password'      => 'users#change_password', as: 'change_password'
  get    'signup'                         => 'users#new'
  get    'login'                          => 'sessions#new'
  get    'users/:id/transactions'         => 'users#transaction_history', as: 'transactions'
  get    'users/:id/review'               => 'users#review', as: 'review'
  post   'review'                         => 'reviews#new'
  post   'login'                          => 'sessions#create'
  delete 'logout'                         => 'sessions#destroy'
  get    'guides'                         => 'guides#index', as: 'index'

  resources :users
  resources :guides
  resources :messages
  resources :reviews

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
