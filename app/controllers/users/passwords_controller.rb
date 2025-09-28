# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  skip_before_action :require_no_authentication, only: [:edit, :update]
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    super do |resource|
      # "resource" aqui é o nosso usuário (current_user)
      # Este bloco só é executado se o Devise conseguir atualizar a senha com sucesso.
      if resource.errors.empty?
        resource.update_column(:senha_provisoria, false)
      end
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
