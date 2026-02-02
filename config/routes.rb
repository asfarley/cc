Rails.application.routes.draw do
  resources :photographs
  resources :commands
  devise_for :users
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'  
  end
  resources :device_states
  resources :devices do
    member do
      get :telemetry_status
    end
  end
  get "devices/:Device_id/pending_commands", to: "commands#pending_commands"


  devise_scope :user do
    authenticated do
      root to: 'devices#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end