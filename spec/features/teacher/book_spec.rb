require "rails_helper"

feature "教職員による書籍登録" do
  include FeaturesSpecHelper
  let(:teacher_member) { create(:teacher_member) }
  let!(:book) { create(:book) }

  before do
    switch_namespace(:teacher)
    login_as_teacher_member(teacher_member)
  end

  scenario "教職員が書籍登録をする" do
    click_link "Q&A 書籍管理"
    click_link "書籍の新規登録"

    within("#container") do
      fill_in "題名", with: "書籍名"
      select "数学", from: "科目"
      select "参考書", from: "参考書or過去問"
      select "2020", from: "年度(過去問)"
    end

    click_button "登録"

    new_book = Book.order(:id).last
    expect(new_book.book_name).to eq("テスト題名")
    expect(new_book.book_subject).to eq("数学")
    expect(new_book.book_type).to eq("work")
    expect(new_book.book_year).to eq("2020")
  end

  scenario "書籍登録の際、書籍名は空欄にできない" do
    
  end
end