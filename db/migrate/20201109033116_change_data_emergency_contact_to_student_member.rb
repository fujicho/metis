class ChangeDataEmergencyContactToStudentMember < ActiveRecord::Migration[6.0]
  def change
    change_column :student_members, :emergency_contact, :string
  end
end
