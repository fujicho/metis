class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :student_member, null: false
      t.references :book, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :subject
      t.timestamps
    end
  end
end
