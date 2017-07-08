class CreateJoinTableBookAuthor < ActiveRecord::Migration[5.1]
  def change
    create_join_table :books, :authors do |t|
      t.index [:book_id, :author_id]
      t.index [:author_id, :book_id]
    end
    add_foreign_key :books_authors, :books
    add_foreign_key :books_authors, :authors
  end
end
