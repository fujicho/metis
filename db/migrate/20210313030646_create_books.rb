class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_name , null: false
      t.string :book_subject, null: false
      t.integer :book_year


      t.timestamps
    end

    add_index :books ,:book_name
  end
end
