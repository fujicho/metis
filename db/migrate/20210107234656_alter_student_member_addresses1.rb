class AlterStudentMemberAddresses1 < ActiveRecord::Migration[6.0]
  def change
    add_index :student_member_addresses, [ :type, :prefecture, :city]
    add_index :student_member_addresses, [ :type, :city]
    add_index :student_member_addresses, :city
  end
end
