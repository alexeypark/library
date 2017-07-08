class Admin::UsersController < AdminController

  def index
    @users = User.all
  end

  def activate
    @user = User.find(params[:id])
    if @user.active
      @user.update(active: false)
      message = "#{@user.email} inactivated"
    else
      @user.update(active: true)
      message = "#{@user.email} activated"
    end
    redirect_to admin_users_path, notice: message
  end

end