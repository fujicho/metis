class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :admin_number, null: false #6桁の個別id
      t.string :hashed_password
      t.boolean :suspended, null: false, default: false

      t.timestamps
    end
  end
end
