class ApplicationController < ActionController::Base
  before_action :force_password_change

  private

  def force_password_change
    if current_user&.senha_provisoria?
      # Esta é a forma robusta de verificar se o usuário já está na página de troca de senha.
      # Estamos checando o nome do controller e da ação, em vez da URL.
      is_on_password_page = controller_name == "passwords" && action_name == "edit"

      unless is_on_password_page
        redirect_to edit_user_password_path, alert: "Por favor, altere sua senha provisória para continuar."
      end
    end
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
