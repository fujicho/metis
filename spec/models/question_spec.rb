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


  end
end
