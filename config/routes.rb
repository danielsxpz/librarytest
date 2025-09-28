Rails.application.routes.draw do
  get "passwords/change"
  get "passwords/update"
  get "home/index"
  namespace :admin do
    get "users/index"
    get "users/new"
    get "users/create"
  end
  devise_for :users

  # Rotas do painel administrativo
  namespace :admin do
    resources :users, only: [:index, :new, :create]
    root 'users#index' # Página inicial do admin
  end

  # Página inicial para usuários normais
  root 'home#index' # Você precisará criar um controller home#index

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # Rota para a página de troca de senha obrigatória
  resource :change_password, only: [:edit, :update], controller: 'passwords'
end
