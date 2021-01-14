class AlterStudentMembers1 < ActiveRecord::Migration[6.0]
  def change
    add_column :student_members, :birth_year, :integer
    add_column :student_members, :birth_month, :integer
    add_column :student_members, :birth_mday, :integer

    add_index :student_members, [ :birth_year, :birth_month, :birth_mday],
      name: "index_student_on_birth_year_month_and_mday"
    add_index :student_members, [ :birth_year, :birth_month ]
    add_index :student_members, :family_name_kana
    add_index :student_members, :given_name_kana
    add_index :student_members, [ :birth_year, :family_name_kana, :given_name_kana ],
      name: "index_student_on_birth_year_and_furigana"
    add_index :student_members, [ :grade, :family_name_kana ]
    add_index :student_members, [ :grade , :a_class ]
  end
end
