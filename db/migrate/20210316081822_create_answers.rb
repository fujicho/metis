class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false
      t.references :teacher_member
      t.references :student_memner
      t.string :body

      t.timestamps
    end
    add_foreign_key :answers, :question
    add_foreign_key :answers, :teacher_member
    add_foreign_key :answers, :student_member
  end
end
