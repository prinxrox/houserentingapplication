class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      adminindex_path
    elsif resource.class == Realtor
      realtorindex_path
    elsif resource.class == Hunter
      hunterindex_path
      end
  end

  def after_sign_out_path_for(resource)
    if resource == :realtor
      new_realtor_session_path
    elsif resource == :admin
      new_admin_session_path
    elsif resource == :hunter
      new_hunter_session_path
    else
      root_path
    end
  end





end

