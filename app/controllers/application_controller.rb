class ApplicationController < ActionController::Base

  before_action :force_password_change

  private

  def force_password_change
    # Verifica se o usuário está logado E se a flag está ativa
    if current_user&.senha_provisoria?
      # Evita um loop infinito de redirecionamento
      unless request.path == edit_change_password_path
        redirect_to edit_change_password_path, alert: "Por favor, altere sua senha provisória para continuar."
      end
    end
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
