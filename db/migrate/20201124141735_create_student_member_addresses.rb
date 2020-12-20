class CreateStudentMemberAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_member_addresses do |t|
      t.references :student_member, null: false #生徒への外部キー
      t.string :type, null: false #継承カラム
      t.string :postal_code, null:false #郵便番号
      t.string :prefecture, null: false #都道府県
      t.string :city, null: false #市区町村
      t.string :address1, null: false #番地等
      t.string :address2 #建物名,部屋番号

      t.timestamps
    end
    add_index :student_member_addresses, [ :type, :student_member_id ], unique: true
    add_foreign_key :student_member_addresses, :student_members
  end
end
