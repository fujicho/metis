require "rails_helper"

feature "生徒による質問投稿機能" do
  include FeaturesSpecHelper
  let(:student_member) { create(:student_member) }
  let!(:book) { create(:book) }

  before do
    switch_namespace(:student)
    login_as_student_member(student_member)
  end

  scenario "生徒が質問する書籍を検索する" do
    first(".side-nav").click_link "質問する・似たような質問を探す"
    
    within("#container") do
      fill_in "書籍名", with: "参考書その1"
      select "数学", from: "教科"
      select "参考書", from: "参考書or過去問"
      select "2015", from: "年度(過去問)"
    end
    click_button "検索"

    expect(page).to have_content "参考書その1"
  end

  scenario "生徒が質問を投稿する。" do
    first(".side-nav").click_link "質問する・似たような質問を探す"
    
    first("tbody tr").click_link "質問する"

    within("#container") do
      fill_in "タイトル", with: "質問タイトル"
      fill_in "質問内容", with: "質問質問質問です。"
    end

    click_button "確認画面へ進む"
    click_button "送信"

    new_question = Question.order(:id).last
    expect(new_question.title).to eq("質問タイトル")
    expect(new_question.body).to eq("質問質問質問です。")
  end

  scenario "質問の際、タイトルは空欄にできない。(バリデーションエラーメッセージテスト)" do
    first(".side-nav").click_link "質問する・似たような質問を探す"
    
    first("tbody tr").click_link "質問する"
    
    within("#container") do
      fill_in "質問内容", with: "質問質問質問です。"
    end
    
    click_button "確認画面へ進む"
    expect(page).to have_content "タイトルが入力されていません"
  end

  scenario "質問の際、タイトルと本文両方空欄にはできない。(バリデーションエラーメッセージが同時に表示されるかどうかのテスト)" do
    first(".side-nav").click_link "質問する・似たような質問を探す"
    
    first("tbody tr").click_link "質問する"

    click_button "確認画面へ進む"

    expect(page).to have_content "タイトルが入力されていません"
    expect(page).to have_content "本文が入力されていません"
  end
end