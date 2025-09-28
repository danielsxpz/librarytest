# config/routes.rb

Rails.application.routes.draw do
  # Configura todas as rotas necessárias para o Devise (login, logout, etc.)

devise_for :users, controllers: {
  sessions: "users/sessions",
  passwords: "users/passwords"
}

  # Define a rota para a página de troca de senha obrigatória
  # Isso cria `GET /change_password/edit` e `PATCH /change_password`

  # Agrupa todas as rotas do painel de administração sob o namespace /admin
  namespace :admin do
    # Cria as rotas para index, new e create para os usuários (bibliotecários)
    resources :users, only: [:index, :new, :create]
    # Define a página inicial do painel de admin
    root "users#index"
  end

  # Define a página inicial para todos os outros usuários
  root "home#index"

  # Rota para verificação de saúde da aplicação (padrão do Rails)
  get "up" => "rails/health#show", as: :rails_health_check
end