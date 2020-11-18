class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :teacher_member, null: false #教職員への外部キー
      t.string :postal_code, null:false #郵便番号
      t.string :prefecture, null: false #都道府県
      t.string :city, null: false #市区町村
      t.string :address1, null: false #番地等
      t.string :address2 #建物名,部屋番号
      

      t.timestamps
    end
    add_foreign_key :addresses, :teacher_members
  end
end
