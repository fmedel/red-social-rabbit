Rails.application.routes.draw do
################################################################################################################3
              #todo lo relacionado con los tipo controler tipo 
              #todo ok hasta el eliminar esta listo
    get 'tipo(.:format)', to: 'tipo#index', as: :tipo
    get 'tipo_guardar(.:format)', to: 'tipo#new' , as: :tipo_guardar
    post 'tipo_guardar(.:format)', to: 'tipo#create' , as: :tipo_guardar_ok
    get 'tipo/:id/editar(.:format)', to: 'tipo#edit' , as: :editar_tipo  
    patch 'ver_tipo/:id(.:format)', to: 'tipo#update' 
    put 'ver_tipo/:id(.:format)', to: 'tipo#update'
    get 'ver_tipo/:id(.:format)', to: 'tipo#show' , as: :ver_tipo 
    delete 'ver_tipo/:id(.:format)', to: 'tipo#destroy' , as: :eliminar_tipo
##############################################################################################################     
            #todo lo relacionado con los estado controler estado
              #todo ok hasta el eliminar esta listo
    get 'estado(.:format)', to: 'estado#index', as: :estado
    get 'estado_guardar(.:format)', to: 'estado#new' , as: :estado_guardar
    post 'estado_guardar(.:format)', to: 'estado#create' , as: :estado_guardar_ok
    get 'estado/:id/editar(.:format)', to: 'estado#edit' , as: :editar_estado
    patch 'ver_estado/:id(.:format)', to: 'estado#update' 
    put 'ver_estado/:id(.:format)', to: 'estado#update'
    get 'ver_estado/:id(.:format)', to: 'estado#show' , as: :ver_estado
    delete 'ver_estado/:id(.:format)', to: 'estado#destroy' , as: :eliminar_estado       
#############################################################################################################
            #todo lo relacionado con los grado controler grado
              #todo ok hasta el eliminar esta listo
    get 'grado(.:format)', to: 'grado#index', as: :grado
    get 'grados_guardar(.:format)', to: 'grado#new' , as: :grados_guardar
    post 'grados_guardar(.:format)', to: 'grado#create' , as: :grados_guardar_ok
    get 'grados/:id/editar(.:format)', to: 'grado#edit' , as: :editar_grados  
    patch 'ver_grado/:id(.:format)', to: 'grado#update' 
    put 'ver_grado/:id(.:format)', to: 'grado#update'
    get 'ver_grado/:id(.:format)', to: 'grado#show' , as: :ver_grado
    delete 'ver_grado/:id(.:format)', to: 'grado#destroy' , as: :eliminar_grado                      
##############################################################################################################
                #todo lo relacionado con apelar idea   controler apelar 
    get 'apelar(.:format)', to: 'apelar#index', as: :apelar_index
    get 'apelar/:denunciar(.:format)', to: 'apelar#new', as: :apelar
    post 'apelar/:denunciar(.:format)', to: 'apelar#create' , as: :guardar_apelacion
    get 'ver_apelelacion/:denunciar(.:format)', to: 'apelar#show' , as: :ver_apelelacion 
    get 'apelar_idea/:denunciar/:id_denuncia/:id_apelar(.:format)', to: 'apelar#apelar_idea', as: :apelar_idea 
    get 'rechasar_apelacion/:denunciar/:id_denuncia/:id_apelar(.:format)', to: 'apelar#rechasar_apelacion', as: :rechasar_apelacion         
##############################################################################################################
                #todo lo relacionado con denunciar idea   controler denunciar 
    get 'denunciar(.:format)', to: 'denunciar#index', as: :denunciar_index
    get 'denunciar/:idea(.:format)', to: 'denunciar#new', as: :denunciar
    post 'denunciar/:idea(.:format)', to: 'denunciar#create' , as: :guardar_denuncia
    get 'ver_denunciar/:idea(.:format)', to: 'denunciar#show' , as: :ver_denunciar 
    get 'dar_de_baja/:idea/:denuncia(.:format)', to: 'denunciar#dar_de_baja', as: :dar_de_baja
    get 'rechasar/:idea/:denuncia(.:format)', to: 'denunciar#rechasar', as: :rechasar                    
###############################################################################################################
                #barra de busqueda 
    get 'search/create'
    get 'search/apelar'
###############################################################################################################
                #todo lo relacionado con postular  controler postualar 
    get 'postular(.:format)/:idea', to: 'postular#new', as: :postular
    post 'postular(.:format)/:idea', to: 'postular#create' , as: :guardar_postulacion
    get 'aceptar_postulacion(.:format)/:idea/:user', to: 'postular#aceptar_postulacion' , as: :aceptar_postulacion
###############################################################################################################
                #todo lo relacionado con user  controler user 
    get 'users/:tipo/editar(.:format)', to: 'users_editar#edit' , as: :editar_perfil  
    get 'users(.:format)', to: 'welcome#index'
    get 'users/:tipo/editar(.:format)', to: 'users_editar#show' , as: :ver_perfil                       
    patch 'users/:tipo/editar(.:format)', to: 'users_editar#update' 
    put 'users/:tipo/editar(.:format)', to: 'users_editar#update'
    delete 'users/:id(.:format)', to: 'users_editar#destroy' , as: :eliminar_perfil
    get 'users/:tipo(.:format)',to: 'users_editar#tipo' , as: :tipo_perfil
    get 'perfil/:perfil(.:format)',to: 'users_editar#index' , as: :perfil
    get 'perfil(.:format)', to: 'welcome#index'

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

###########################################################################################################################
  #resources :ideas       
    get 'ver_idea(.:format)', to: 'ideas#index' , as: :index
    get 'mi_idea/:tipo(.:format)', to: 'ideas#mi_ideas'  , as: :mi_idea     
    get  'mi_idea(.:format)', to: 'welcome#index' 
    post 'ver_idea(.:format)', to: 'ideas#create' , as: :guardar
    get 'nueva_idea', to: 'ideas#new' , as: :nueva_idea
    get 'ver_idea/:id/editar(.:format)', to: 'ideas#edit' , as: :editar_idea  
    get 'ver_idea/:id(.:format)', to: 'ideas#show' , as: :ver_idea                       
    patch 'ver_idea/:id(.:format)', to: 'ideas#update' 
    put 'ver_idea/:id(.:format)', to: 'ideas#update'
    delete 'ver_idea/:id(.:format)', to: 'ideas#destroy' , as: :eliminar
    get 'dar_de_baja_idea/:idea(.:format)', to: 'ideas#dar_de_baja', as: :dar_de_baja_idea
#############################################################################################################################
    get 'inicio', to: 'welcome#index' , as: :inicio
    get 'new/:tipo', to: 'welcome#new',as: :new_moderador
    post 'new/:tipo', to: 'welcome#create', as: :new_moderador_ok
    get 'datos/:ver_tipos', to: 'welcome#datos', as: :datos
    root to: "welcome#index"
#############################################################################################################################   
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
