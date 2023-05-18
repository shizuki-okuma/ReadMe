class Providers::SessionsController < Devise::SessionsController
  def guest_sign_in
    provider = Provider.guest
    sign_in provider
    redirect_to my_page_providers_providers_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def provider_state
    @provider = Provider.find_by(email: params[:provider][:email])
    return if !@provider
    if @provider.present? && @provider.valid_password?(params[:provider][:password])
      redirect_to new_provider_registration_path
    end
  end
end
