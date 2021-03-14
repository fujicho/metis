class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_name , null: false #問題集の題名または過去問の大学名
      t.string :book_subject, null: false #科目
      t.integer :book_year #過去問の年数または問題集の発行年度
      t.integer :faculty_name #過去問の学部名
      t.string :type, null: false #過去問か問題集か

      t.timestamps
    end

    add_index :books ,:book_name
  end
end
