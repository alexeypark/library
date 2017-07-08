class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rate, presence: true
  validates :body, presence: true
end
