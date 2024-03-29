require 'rails_helper'

RSpec.describe TeacherMember, type: :model do
  describe "#password=" do
    example "文字列を与えるとhashed_passwordは長さ60の文字列になる" do
      member = TeacherMember.new
      member.password = "password"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example "nilを与えると、hashed_passwordはnilになる"do
      member = TeacherMember.new(hashed_password: "hohohoge")
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end

  describe "値の正規化" do
    example "family_name_kanaに含まれる平仮名をカタカナに変換" do
      teacher = create(:teacher_member, family_name_kana: "ふじた")
      expect(teacher.family_name_kana).to eq("フジタ")
    end

    example "family_name_kanaに含まれる半角カナを全角カナに変換" do
      teacher = create(:teacher_member, family_name_kana: "ﾌｼﾞﾀ")
      expect(teacher.family_name_kana).to eq("フジタ")
    end

    example "email前後の空白を除去" do
      teacher = create(:teacher_member, email: " test@example.com ")
      expect(teacher.email).to eq("test@example.com")
    end

    example "emailに含まれる全角英数字を半角英数字に変換" do
      teacher = create(:teacher_member, email: "ｔｅｓｔ＠ｅｘａｍｐｌｅ.ｃｏｍ")
      expect(teacher.email).to eq("test@example.com")
    end

    example "email前後の全角英数字を除去" do
      teacher = create(:teacher_member, email: "\u{3000}test@example.com\u{3000}")
      expect(teacher.email).to eq("test@example.com")
    end
  end

  describe "バリデーション" do
    example "family_name_kanaに漢字が含まれていた場合無効" do
      teacher = build(:teacher_member, family_name_kana: "ふじ田")
      expect(teacher).not_to be_valid
    end

    example "family_name_kanaに長音符が含まれていても有効" do
      teacher = build(:teacher_member, family_name_kana: "トミー")
      expect(teacher).to be_valid
    end

    example "family_nameに英字が含まれていても有効" do
      teacher = build(:teacher_member, family_name: "tomy")
      expect(teacher).to be_valid
    end

    example "family_name_kanaに長音符が含まれていても有効" do
      teacher = build(:teacher_member, family_name: "@藤田")
      expect(teacher).not_to be_valid
    end

    example "birth_dayには未来の日付は設定できない" do
      teacher = build(:teacher_member, birthday: Date.today + 1)
      expect(teacher).not_to be_valid
    end

    example "@を2個含むemailは無効" do
      teacher = build(:teacher_member, email: "test@@example.com")
      expect(teacher).not_to be_valid
    end

    example "他のteacherとemailが重複している場合は無効" do
      teacher1 = create(:teacher_member)
      teacher2 = build(:teacher_member, email: teacher1.email)
      expect(teacher2).not_to be_valid
    end
  end
end
