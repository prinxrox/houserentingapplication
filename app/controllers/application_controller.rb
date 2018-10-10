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






end

