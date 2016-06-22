Rails.application.routes.draw do


  devise_for :users
  namespace :api do
    namespace :v1 do

      resources :users, :path => 'user', :as => :user, default: {format: :json} do
        post :register, on: :collection
        post :login, on: :collection
        post :logout, on: :collection
        post :forgot, on: :collection
        get  :details, on: :collection
        put  :update, on: :collection
        put  :password, on: :collection
        post :guest, on: :collection
        get  :dummy,on: :collection
      end

      resources :gallery, :path => 'gallery', :as => :gallery, default: {format: :json} do
           post :addgallery, on: :collection
           post :addphotos, on: :collection
           get :getalbumphotos, on: :collection
           put :updategallery, on: :collection
           put :updategalleryphotos, on: :collection
      end
      resources :portfolio, :path=> 'portfolio', :as =>:portfolio,default:{format: :json} do
           post   :addproject,on: :collection
           delete :deleteproject,on: :collection
           get    :expireproject,on: :collection
           get    :editproject,on: :collection
      end   
    end        
  end     

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

  match '*all' => 'application#cors', via: :options
end
