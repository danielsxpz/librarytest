class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(password_params)
      # Importante: desativa a flag e faz o re-login para atualizar a sessão
      @user.update(senha_provisoria: false)
      bypass_sign_in(@user) # Evita que o Devise deslogue o usuário
      redirect_to root_path, notice: "Senha alterada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end