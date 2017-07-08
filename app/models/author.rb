class Author < ApplicationRecord
  has_and_belongs_to_many :books

  def overall_rate
    books.any?{|book| book.reviews.count > 0} ? (books.inject(0.0) { |sum, el| sum + el.rate_count } / books.count).round(1) : 0.0
  end
end
