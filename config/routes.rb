Rails.application.routes.draw do  

  get 'funcionamiento_salas_v2/show'

  get 'institucion_que_dieron_apoyo/index'

  resources :room_categories

  resources :hotels

      resources :funcionamiento_salas do  
        collection do
          post 'obtener_usuario_by_email'
        end
      end    

  resources :funcionamiento_salas_v2 do
    member do
      post :pegar_form_datos_integrantes_que_participan_en_otro_proyecto
      post :pegar_form_datos_instituciones_que_dieron_apoyo
      post :agregar_integrante_proyecto_subsidio
      post :agregar_institucion_de_apoyo
      get :show_enviados
      get :enviar
      post :enviado
    end
    collection do
      post 'pegar_form_datos_subsidio_primera_vez'
    end 
    resources :registros_plan_de_gasto_de_funcionamiento_de_sala , only: [:destroy] do
    end
    resources :integrantes_participa_proyecto_subsidio , only: [:destroy] do
    end
    resources :instituciones_que_dieron_apoyo, only: [:destroy] do
    end
    collection do
       post 'traer_registro_de_plan_de_gasto'
    end
  end     

  resources :users

  resources :sessions
     

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
  resources :pub_eventualesusers
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
