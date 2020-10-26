class CreateStudentEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :student_events do |t|

      t.timestamps
    end
  end
end
