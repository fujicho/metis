class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :student_member, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
