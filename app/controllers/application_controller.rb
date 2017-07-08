class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def admin_user
    authenticate_user!
    unless current_user.role?(:admin)
      flash[:alert] = 'You don\'t have enough permissions!'
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:active, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:active, :role])
  end
end
