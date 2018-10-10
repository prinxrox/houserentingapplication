# frozen_string_literal: true

class Realtors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :require_no_authentication, :only => [ :new, :create, :cancel ]
  before_action :authenticate_realtor!


  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :real_estate_company, :real_estate_company_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :real_estate_company, :real_estate_company_id])
  end
end
