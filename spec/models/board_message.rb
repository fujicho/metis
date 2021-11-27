require 'rails_helper'

RSpec.describe BoardMessage, type: :model do
  describe "値の正規化" do
    example "subjectの前後の空白を除去" do
      board_message = create(:board_message, subject: " 新高3向け集金講習会延期のお知らせ ")
      expect(board_message.subject).to eq("新高3向け集金講習会延期のお知らせ")
    end

    example "subjectに含まれる全角数字を半角数字に変換" do
      board_message = create(:board_message, subject: "新高３向け集金講習会延期のお知らせ")
      expect(board_message.subject).to eq("新高3向け集金講習会延期のお知らせ")
    end

    example "subjectに含まれる半角カナを全角カナに変換" do
      board_message = create(:board_message, subject: "ﾊﾟｯﾌﾟｽｷﾞｭﾙﾀﾞﾝの定理使用禁止のお知らせ")
      expect(board_message.subject).to eq("パップスギュルダンの定理使用禁止のお知らせ")
    end
  end

  describe "バリデーション" do
    example "subjectが空欄の場合無効" do
      board_message = build(:board_message, subject:"")
      expect(board_message).not_to be_valid
    end

    example "bodyが空欄の場合無効" do
      board_message = build(:board_message, body:"")
      expect(board_message).not_to be_valid
    end
  end
end