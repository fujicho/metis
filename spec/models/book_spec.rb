require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "値の正規化"
    example "book_nameに含まれる前後の空白を除去" do
      book = create(:book, book_name: " ハイレベル理系数学 ")
      expect(book.book_name).to eq("ハイレベル理系数学")
    end

    example "book_nameに含まれる半角カナを全角カナに変換" do
      book = create(:book, book_name: "ﾊｲﾚﾍﾞﾙ理系数学")
      expect(book.book_name).to eq("ハイレベル理系数学")
    end
    
    example "book_nameに含まれる全角数字を半角文字に変換" do
      book = create(:book, book_name: "理系数学のプラチカ１A２B")
      expect(book.book_name).to eq("理系数学のプラチカ1A2B")
    end
end
