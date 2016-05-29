Rails.application.routes.draw do
    get 'users/:tipo/editar(.:format)', to: 'users_editar#edit' , as: :editar_perfil  
    get 'users/:tipo/editar(.:format)', to: 'users_editar#show' , as: :ver_perfil                       
    patch 'users/:tipo/editar(.:format)', to: 'users_editar#update' 
    put 'users/:tipo/editar(.:format)', to: 'users_editar#update'
    delete 'users/:id(.:format)', to: 'users_editar#destroy' , as: :eliminar_perfil
    get 'users/:tipo(.:format)',to: 'users_editar#tipo' , as: :tipo_perfil

##############################################################################################################
  devise_for :users 
  devise_scope :user do 
   #GET    /users/sign_in(.:format)       
      get 'login',to:'devise/sessions#new',as: :login
   
   #POST   /users/sign_in(.:format)       
      post 'login_error',to:'devise/sessions#create', as: :login_error
  
   #GET    /users/sign_out(.:format)      
      get 'destruir',to:'devise/sessions#destroy', as: :destruiry
   
   #POST   /users/password(.:format)      
      #get '',to:'devise/passwords#create', as: :
   
   #GET    /users/password/new(.:format)  
      get 'comenzar',to:'devise/passwords#new', as: :comenzar
   
   #GET    /users/password/edit(.:format) 
      #get '',to:'devise/passwords#edit', as: : 
   
   #PATCH  /users/password(.:format)      
      #get '',to:'devise/passwords#update', as: :
   
   #PUT    /users/password(.:format)      
      #get '',to:'devise/passwords#update', as: :
  
  #GET    /users/cancel(.:format)        
      #get '',to:'devise/registrations#cancel', as: :
  
  #POST   /users(.:format)               
      #get '',to:'devise/registrations#create', as: :
      
  #GET    /users/sign_up(.:format)      
      get 'registrar',to:'devise/registrations#new', as: :registrar
   
   #GET    /users/edit(.:format)          
      get 'editar',to:'devise/registrations#edit', as: :editar
  
  #PATCH  /users(.:format)               
      #get '',to:'devise/registrations#update', as: :
  
  #PUT    /users(.:format)               
      #get '',to:'devise/registrations#update', as: :
  
  #DELETE /users(.:format)               
      #get '',to:'devise/registrations#destroy', as: :
  end
###########################################################################################################################
  #resources :ideas       
    get 'ver_idea(.:format)', to: 'ideas#index'    
    post 'ver_idea(.:format)', to: 'ideas#create' , as: :guardar
    get 'nueva_idea', to: 'ideas#new' , as: :nueva_idea
    get 'ver_idea/:id/editar(.:format)', to: 'ideas#edit' , as: :editar_idea  
    get 'ver_idea/:id(.:format)', to: 'ideas#show' , as: :ver_idea                       
    patch 'ver_idea/:id(.:format)', to: 'ideas#update' 
    put 'ver_idea/:id(.:format)', to: 'ideas#update'
    delete 'ver_idea/:id(.:format)', to: 'ideas#destroy' , as: :eliminar

#############################################################################################################################
  get 'inicio', to: 'welcome#index' , as: :inicio
  root to: "welcome#index"
    
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
