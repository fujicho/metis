class CreateStudentMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :student_members do |t|
      t.string :student_number, null: false # 8桁の学生ID
      t.string :email, null: false # メールアドレス
      t.string :family_name, null: false # 姓
      t.string :given_name, null: false # 名
      t.string :family_name_kana, null: false # 姓(カナ)
      t.string :given_name_kana, null: false # 名(カナ)
      t.string :gender, null: false #性別
      t.string :birth_day, null: false #6桁の数字での生年月日
      t.string :telephone_number, null: false #電話番号
      t.string :emergency_contact, null: false #緊急連絡先
      t.string :hashed_password # パスワード
      t.integer :grade, null: false #学年
      t.integer :a_class, null: false #クラス
      t.string :homeroom_teacher, null: false #担任名
      t.date :start_date, null: false # 入学日
      t.date :graduation_date #卒業予定日
      t.boolean :suspended, null: false, default: false #アカウント停止フラグ
      
      t.timestamps
    end
  end
end