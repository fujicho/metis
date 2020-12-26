require "rails_helper"

feature "教職員による生徒管理" do
  include FeaturesSpecHelper
  let(:teacher_member) { create(:teacher_member) }
  let!(:student_member) { create(:student_member)}

  before do
    switch_namespace(:teacher)
    login_as_teacher_member(teacher_member)
  end

  scenario "教職員が生徒情報、住所を更新する" do
    click_link "学生管理"
    first("#container").click_link "編集"

    within("fieldset#student-fields") do
      fill_in "メールアドレス", with: "test@example.com"
    end

    within("fieldset#home-address-fields")do
      fill_in "郵便番号", with: "1111111"
    end

    click_button "更新"

    student_member.reload
    expect(student_member.email).to eq("test@example.com")
    expect(student_member.home_address.postal_code).to eq("1111111")
  end
end