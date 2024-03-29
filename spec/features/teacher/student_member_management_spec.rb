require "rails_helper"

feature "教職員による生徒管理" do
  include FeaturesSpecHelper
  let(:teacher_member) { create(:teacher_member) }
  let!(:student_member) { create(:student_member)}

  before do
    switch_namespace(:teacher)
    login_as_teacher_member(teacher_member)
  end

  scenario "教職員が生徒情報、住所を新規登録する" do
    first(".side-nav").click_link "学生管理"
    click_link "新規登録はこちら"

    within("#student-info") do
      fill_in "学生番号", with: "99999999"
      fill_in "form_student_member_family_name", with: "藤田"
      fill_in "form_student_member_given_name", with: "広重"
      fill_in "form_student_member_family_name_kana", with: "フジタ"
      fill_in "form_student_member_given_name_kana", with: "ヒロシゲ"
      choose "form_student_member_gender_male"
      fill_in "生年月日", with: "2003-4-23"
      fill_in "学年", with: "1"
      fill_in "クラス", with: "1"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "電話番号", with: "08011111111"
      fill_in "緊急連絡先", with: "08022222222"
      fill_in "担任名", with: "長田"
      fill_in "入学日", with: "2018-4-23"
      fill_in "卒業予定日", with: "2021-3-31"
    end

    within("#student-address") do
      fill_in "郵便番号", with: "1111111"
      select "東京都", from: "都道府県"
      fill_in "市区町村", with: "中央区"
      fill_in "町域、番地等", with: "てすと町"
      fill_in "建物名、部屋番号等", with: "なんちゃらハイツ101"
    end
    check "form[inputs_parents_address]"
    within("#parents-address") do
      fill_in "郵便番号", with: "2222222"
      select "北海道", from: "都道府県"
      fill_in "市区町村", with: "南区"
      fill_in "町域、番地等", with: "テスト村"
      fill_in "建物名、部屋番号等", with: "試験ヒルズ1101"
    end

    click_button "登録"

    new_student = StudentMember.order(:id).last
    expect(new_student.email).to eq("test@example.com")
    expect(new_student.birth_day).to eq(Date.new(2003,4,23))
    expect(new_student.gender).to eq("male")
    expect(new_student.home_address.postal_code).to eq("1111111")
    expect(new_student.parents_address.postal_code).to eq("2222222")
  end

  scenario "教職員が生徒情報、住所を更新する" do
    first(".side-nav").click_link "学生管理"
    first("#container").click_link "編集"

    fill_in "form_student_member_email", with: "test2@example.com"

    within("fieldset#home-address-fields")do
      fill_in "郵便番号", with: "1000000"
    end

    click_button "更新"

    student_member.reload

    expect(student_member.email).to eq("test2@example.com")
    expect(student_member.home_address.postal_code).to eq("1000000")
  end

  scenario "教職員が生徒情報、住所を更新する際、student_memberに適切な値、
    student_member.home_addressに不適切な値を入れた場合、両方とも更新されない" do
    
    first(".side-nav").click_link "学生管理"
    first("#container").click_link "編集"

    fill_in "form_student_member_email", with: "test@example.com"

    within("fieldset#home-address-fields")do
      fill_in "郵便番号", with: "abc"
    end

    click_button "更新"

    student_member.reload

    expect(student_member.email).not_to eq("test@example.com")
    expect(student_member.home_address.postal_code).not_to eq("abc")
  end

  scenario "教職員がfamily_name_kanaを用いて生徒情報を検索する。" do
    first(".side-nav").click_link "学生管理"

    fill_in "search_family_name_kana", with: "ヤマオカ"
    
    click_button "検索"

    expect(page).to have_content "山岡"
  end

  scenario "教職員が電話番号を用いて生徒情報を検索する。電話番号フォームからtelephone_number,emergency_contactどちらのカラムも検索することができる。
              本テストはtelephone_numberから" do
    first(".side-nav").click_link "学生管理"

    fill_in "search_phone_number", with: "12345678900"
      
    click_button "検索"

    expect(page).to have_content "山岡"
  end

  scenario "教職員が電話番号を用いて生徒情報を検索する。電話番号フォームからtelephone_number,emergency_contactどちらのカラムも検索することができる。
              本テストはemergency_contactから" do
    first(".side-nav").click_link "学生管理"

    fill_in "search_phone_number", with: "12345678900"
      
    click_button "検索"

    expect(page).to have_content "山岡"
  end

  scenario "教職員がハイフン入りの電話番号を用いて生徒情報を検索する。(正規化のテスト)" do
    first(".side-nav").click_link "学生管理"

    fill_in "search_phone_number", with: "123-4567-8900"
      
    click_button "検索"

    expect(page).to have_content "山岡"
  end
end