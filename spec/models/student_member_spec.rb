require 'rails_helper'

RSpec.describe StudentMember, type: :model do
  describe "#password=" do
    example "文字列を与えるとhashed_passwordは長さ60の文字列になる" do
      student = StudentMember.new
      student.password = "password"
      expect(student.hashed_password).to be_kind_of(String)
      expect(student.hashed_password.size).to eq(60)
    end

    example "nilを与えると、hashed_passwordはnilになる"do
      student = StudentMember.new(hashed_password: "hohohoge")
      student.password = nil
      expect(student.hashed_password).to be_nil
    end
  end

  describe "値の正規化" do
    example "stundent_numberの前後の空白を除去" do
      student = create(:student_member, student_number: " 00000000 ")
      expect(student.student_number).to eq("00000000")
    end

    example "stundent_numberの全角数字を半角文字に変換" do
      student = create(:student_member, student_number: "００００００００")
      expect(student.student_number).to eq("00000000")
    end

    example "family_name_kanaに含まれる平仮名をカタカナに変換" do
      student = create(:student_member, family_name_kana: "ふじた")
      expect(student.family_name_kana).to eq("フジタ")
    end

    example "family_name_kanaに含まれる半角カナを全角カナに変換" do
      student = create(:student_member, family_name_kana: "ﾌｼﾞﾀ")
      expect(student.family_name_kana).to eq("フジタ")
    end

    example "emergency_contactの前後の空白を除去" do
      student = create(:student_member, emergency_contact: " 0300000000 ")
      expect(student.emergency_contact).to eq("0300000000")
    end

    example "emergency_contactの全角数字を半角文字に変換" do
      student = create(:student_member, emergency_contact: "０３００００００００")
      expect(student.emergency_contact).to eq("0300000000")
    end
  end

  describe "バリデーション" do
    example "family_name_kanaに漢字が含まれていた場合無効" do
      student = build(:student_member, family_name_kana: "ふじ田")
      expect(student).not_to be_valid
    end

    example "family_name_kanaに長音符が含まれていても有効" do
      student = build(:student_member, family_name_kana: "トミー")
      expect(student).to be_valid
    end

    example "family_nameに英字が含まれていても有効" do
      student = build(:student_member, family_name: "tomy")
      expect(student).to be_valid
    end

    example "family_nameに記号が含まれていると無効" do
      student = build(:student_member, family_name: "@藤田")
      expect(student).not_to be_valid
    end

    

    example "birth_dayには未来の日付は設定できない" do
      student = build(:student_member, birth_day: Date.today + 1)
      expect(student).not_to be_valid
    end
  end
end
