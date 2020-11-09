class ChangeDataTelephoneNumberToStudentMember < ActiveRecord::Migration[6.0]
  def change
    change_column :student_members, :telephone_number, :string
  end
end
