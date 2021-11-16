class AlterTeacherMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :teacher_members, :guest, :boolean
  end
end
