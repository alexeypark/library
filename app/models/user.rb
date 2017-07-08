class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def role?(r)
    role.include? r.to_s
  end
end
