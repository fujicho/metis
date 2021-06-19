require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "値の正規化" do
    example "bodyの前後の空白を除去" do
      answer = create(:answer, body: " これはバームクーヘン積分で1発です。 ")
      expect(answer.body).to eq("これはバームクーヘン積分で1発です。")
    end

    example "bodyに含まれる全角数字を半角数字に変換" do
      answer = create(:answer, body: "これはバームクーヘン積分で１発です。")
      expect(answer.body).to eq("これはバームクーヘン積分で1発です。")
    end

    example "bodyに含まれる半角カナを全角カナに変換" do
      answer = create(:answer, body: "これはﾊﾞｰﾑｸｰﾍﾝ積分で１発です。")
      expect(answer.body).to eq("これはバームクーヘン積分で1発です。")
    end
  end

  describe "バリデーション" do
    example "bodyが空欄の場合無効" do
      answer = build(:answer, body: "")
      expect(answer).not_to be_valid
    end
  end
end
