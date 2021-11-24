require "rails_helper"

feature "教職員による掲示板投稿、編集機能" do
  include FeaturesSpecHelper
  let(:teacher_member) { create(:teacher_member) }
  let!(:board_message) { create(:board_message) }

  before do
    switch_namespace(:teacher)
    login_as_teacher_member(teacher_member)
  end

  scenario "教職員が掲示板投稿機能を用い、題名、本文、タグ付けをし確認画面に遷移し、投稿する" do
    first(".side-nav").click_link "掲示板投稿"

    within("#container") do
      fill_in "題名", with: "テスト題名"
      fill_in "本文", with: "テストテストテスト本文"
      select "文系", from: "文理"
    end

    click_button "確認画面へ進む"
    expect(current_path).to eq confirm_teacher_board_messages_path

    click_button "送信"

    new_board_message = BoardMessage.order(:id).last
    expect(new_board_message.subject).to eq("テスト題名")
    expect(new_board_message.body).to eq("テストテストテスト本文")
    expect(new_board_message.tag).to eq("文系")
  end

  scenario "題名を空欄にすると投稿できない" do
    first(".side-nav").click_link "掲示板投稿"

    within("#container") do
      fill_in "本文", with: "テスト"
      select "理系", from: "文理"
    end

    click_button "確認画面へ進む"

    expect(page).to have_content "題名が入力されていません。"
  end

  scenario "複数の項目を空欄にすると、複数のバリデーションエラーメッセージが表示される" do
    first(".side-nav").click_link "掲示板投稿"

    within("#container") do
      fill_in "題名", with: "テスト"
    end

    click_button "確認画面へ進む"

    expect(page).to have_content "本文が入力されていません"
    expect(page).to have_content "タグは一覧にありません"
  end

  scenario "教職員が投稿済みの内容を編集する" do
    bm = BoardMessage.order(:id).last
    visit edit_teacher_board_message_path(bm)

    within("#container") do
      fill_in "題名", with: "講習会中止のお知らせ"
      fill_in "本文", with: "教師都合により中止になりました。調整後再度募集致します。"
      select "理系", from: "文理"
    end

    click_button "確認画面へ進む"

    click_button "送信"

    board_message.reload

    new_board_message = BoardMessage.order(:id).last

    expect(new_board_message.subject).to eq("講習会中止のお知らせ")
    expect(new_board_message.body).to eq("教師都合により中止になりました。調整後再度募集致します。")
  end

  scenario "教職員が投稿済みの内容を空白にすると編集投稿できない" do
    bm = BoardMessage.order(:id).last
    visit edit_teacher_board_message_path(bm)

    within("#container") do
      fill_in "題名", with: ""
      fill_in "本文", with: "教師都合により中止になりました。調整後再度募集致します。"
      select "理系", from: "文理"
    end

    click_button "確認画面へ進む"
    
    expect(page).to have_content "題名が入力されていません。"
  end
end