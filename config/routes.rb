Rails.application.routes.draw do

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


root 'cocktails#index'

resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
  resources :doses, only: [:new, :create, :destroy]
end
mount Attachinary::Engine => "/attachinary"

# A user can see the list of all cocktails
# GET "cocktails"
# A user can see the details of a given cocktail, with the ingredient list
# GET "cocktails/42"
# A user can create a new cocktail.
# GET "cocktails/new"
# POST "cocktails"
# A user can add a new dose (ingredient/description pair) on an existing cocktail.
# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"
# A user can delete a dose on an existing cocktail
# DELETE "doses/25"

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
