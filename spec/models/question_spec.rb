require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "値の正規化" do
    example "titleの前後の空白を除去" do
      question = create(:question, title: " 2題目がわかりません。 ")
      expect(question.title).to eq("2題目がわかりません。")
    end

    example "titleの全角数字を半角数字に変換" do
      question = create(:question, title: "２題目がわかりません。")
      expect(question.title).to eq("2題目がわかりません。")
    end

    example "titleに含まれる半角カナを全角カナに変換" do
      question = create(:question, title: "方向ﾍﾞｸﾄﾙに関しての質問です。")
      expect(question.title).to eq("方向ベクトルに関しての質問です。")
    end
  end

  describe "バリデーション" do
    example "titleが空欄の場合無効" do
      question = build(:question, title: "")
      expect(question).not_to be_valid
    end

    example "bodyが空欄の場合無効" do
      question = build(:question, body: "")
      expect(question).not_to be_valid
    end
  end
end
