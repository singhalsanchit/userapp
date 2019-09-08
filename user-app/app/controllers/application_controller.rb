class ApplicationController < ActionController::Base
 layout :layout_by_resource
 # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def configure_permitted_parameters
    added_attrs = [:user_name,:secret_code, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private
  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end
end
