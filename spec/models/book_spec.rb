require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "値の正規化" do
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

  describe "バリデーション" do
    example "book_nameが空欄の場合無効" do
      book = build(:book, book_name: "")
      expect(book).not_to be_valid
    end

    example "book_subjectが空欄の場合無効" do
      book = build(:book, book_subject: "")
      expect(book).not_to be_valid
    end

    example "book_typeが空欄の場合無効" do
      book = build(:book, book_type: "")
      expect(book).not_to be_valid
    end
  end
end
