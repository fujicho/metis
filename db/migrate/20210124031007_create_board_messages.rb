class CreateBoardMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :board_messages do |t|
      t.references :teacher_member, null: false
      t.string :tag, null: false
      t.string :subject, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_index :board_messages [ :tag ]
    add_foreign_key :board_messages, :teacher_member
  end
end
