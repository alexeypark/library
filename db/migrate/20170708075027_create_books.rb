class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.boolean :active, default: false
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
