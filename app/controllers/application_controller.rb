class ApplicationController < ActionController::Base

  before_action :force_password_change

  private

  def force_password_change
    if current_user&.senha_provisoria?
      # A rota correta do Devise não precisa de argumento
      # Esta verificação agora vai funcionar e quebrar o loop
      if request.path != edit_user_password_path
        redirect_to edit_user_password_path, alert: "Por favor, altere sua senha provisória para continuar."
      end
    end
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
