class CreateTeacherMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_members do |t|
      t.string :email, null: false # メールアドレス
      t.string :family_name, null: false # 姓
      t.string :given_name, null: false # 名
      t.string :family_name_kana, null: false # 姓(カナ)
      t.string :given_name_kana, null: false # 名(カナ)
      t.string :hashed_password # パスワード
      t.string :subject # 担当科目
      t.string :gender #性別
      t.string :homeroom_1 #3桁での担任クラス
      t.string :homeroom_2 #3桁での担任クラス
      
      t.date :birthday #誕生日
      t.date :start_date, null: false # 入職日
      t.date :end_date #退職日
      t.boolean :suspended, null: false, default: false #アカウント停止フラグ
      

      t.timestamps
    end

    add_index :teacher_members, "LOWER(email)", unique: true
    add_index :teacher_members, [ :family_name_kana, :given_name_kana ]
  end
end
