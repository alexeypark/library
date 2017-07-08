class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_user
    authenticate_user!
    unless current_user.role?(:admin)
      flash[:alert] = 'You don\'t have enough permissions!'
      redirect_to root_path
    end
  end
end
