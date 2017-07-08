class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors
  belongs_to :user
  has_many :images
  has_many :reviews

  mount_uploader :cover, CoverUploader
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_acceptance_of :terms, allow_nil: false, message: :terms_not_accepted, on: :create
  validates :name, presence: true

  def rate_count
    reviews.length > 0 ? reviews.average(:rate).to_f.round(1) : 0.0
  end

  def self.search(search_term)
    return all unless search_term.present?
    where(['name LIKE ? OR description LIKE ?', "%#{search_term}%", "%#{search_term}%"])
  end
end
