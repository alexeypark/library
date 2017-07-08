class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin_user
    unless current_user.role == 'admin'
      flash[:danger] = "You don't have enough permissions"
      redirect_to root_url
    end
  end
end
