class Admin::UsersController < ApplicationController
  # Garante que o usuário está logado e é um admin
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.where(admin: false).order(:nome)
  end

  def new
    @user = User.new
  end

  def create
    senha_provisoria = Devise.friendly_token.first(8)
    @user = User.new(user_params)
    @user.password = senha_provisoria
    @user.password_confirmation = senha_provisoria # Devise exige a confirmação
    @user.senha_provisoria = true # Garante que a flag está ativa

    if @user.save
      # Mostra a senha provisória para o admin copiar e passar para o bibliotecário
      redirect_to admin_users_path, notice: "Bibliotecário #{@user.nome} criado com sucesso! Senha provisória: #{senha_provisoria}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email)
  end

  def authorize_admin!
    redirect_to root_path, alert: 'Acesso não autorizado.' unless current_user.admin?
  end
end