class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :teacher_member, foreign_key: true
      t.references :student_member, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
