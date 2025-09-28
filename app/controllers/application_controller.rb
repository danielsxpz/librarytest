class ApplicationController < ActionController::Base

  before_action :force_password_change

  private

  def force_password_change
    if current_user&.senha_provisoria?
      # A rota padrão do Devise para editar a senha é 'edit_user_password_path'
      # Usamos `return if` para garantir que a verificação pare aqui
      return if request.path == edit_user_password_path(current_user)

      redirect_to edit_user_password_path(current_user), alert: "Por favor, altere sua senha provisória para continuar."
    end
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
