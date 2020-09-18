class CreateTeacherMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_members do |t|

      t.timestamps
    end
  end
end
