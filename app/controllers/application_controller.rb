class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_login_customer

  def after_sign_in_path_for(resource)
    root_path
  end

  def get_login_customer
    @customer = current_customer
  end

  protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :address_number, :phone_number])
  end
end
