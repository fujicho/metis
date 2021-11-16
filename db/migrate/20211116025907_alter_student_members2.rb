class AlterStudentMembers2 < ActiveRecord::Migration[6.0]
  def change
    add_column :student_members, :guest, :boolean
  end
end
