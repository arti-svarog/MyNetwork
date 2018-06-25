# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  #   binding.pry
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])
    user.valid_password?(params[:user][:password])
    flash[:success] = "Please complete your payment process." if (user.payment_status != "success")
    flash[:success] = "Login successfully." if (user.payment_status == "success")
    if (user.payment_status != "success")
     redirect_to payement_url(current_user)
    else
     sign_in user
     redirect_to root_path
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
