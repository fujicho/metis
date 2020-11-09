class CreateStudentEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :student_events do |t|
      t.references :student_member, null: false, index: false, foreign_key: true
      t.string :type, null: false
      t.datetime :created_at, null: false
    end
    
    add_index :student_events, :created_at
    add_index :student_events,[ :student_member_id, :created_at ]
  end
end
