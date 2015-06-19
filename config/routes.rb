Rails.application.routes.draw do

  get 'funcionamiento_de_salas/new'

  get 'funcionamiento_de_salas/index'

  get 'funcionamiento_de_salas/create'

  get 'funcionamiento_de_salas/show'

  get 'funcionamiento_de_salas/edit'

  get 'funcionamiento_de_salas/update'

  get 'funcionamiento_de_salas/destroy'

  resources :sessions
  resources :users
  resources :realiza_eventos
  resources :asist_tecs do
    resources :integrantes_asist_tec do
      collection do
        get :buscador
        post :buscar_persona
      end
    end
    member do
      get :enviar
    end
  end
  resources :pub_periodicas
  resources :pub_eventuales
  resources :pros_inves
  resources :becas_artis
  resources :becas_gestion
  resources :becas_estudios
  resources :solicitudes_soporte
  resources :consultas_estado

  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

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
