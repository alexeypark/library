class CreateJoinTableBookCategory < ActiveRecord::Migration[5.1]
  def change
    create_join_table :books, :categories do |t|
      t.index [:book_id, :category_id]
      t.index [:category_id, :book_id]
    end
    add_foreign_key :books_categories, :books
    add_foreign_key :books_categories, :categories
  end
end
