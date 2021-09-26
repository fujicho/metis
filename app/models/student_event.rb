class StudentEvent < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :member, class_name: "StudentMember", foreign_key: "student_member_id"
  alias_attribute :occurred_at, :created_at

  DESCRIPTIONS = {
    logged_in: "ログイン",
    logged_out: "ログアウト",
    rejected: "アカウント停止済"
  }

  def description
    DESCRIPTIONS[type.to_sym]
  end
end
