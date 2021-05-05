class Book < ApplicationRecord
  has_many :questions, dependent: :restrict_with_exception
  accepts_nested_attributes_for :questions

  validates :book_name, :book_subject, :book_type,presence: true

  require "date"
  this_year = Date.today.year
  years = (1950..this_year).to_a
  BOOK_YEAR = years << "不明"



  SUBJECT_NAMES = %w(
    英語 数学 物理 化学 現代文 古典 世界史 日本史 地理
  )

  UNIVERSITY_NAMES = %w(
    北海道大学 東北大学 東京大学 名古屋大学 京都大学 大阪大学 九州大学
    一橋大学 東京工業大学
    早稲田大学 慶應義塾大学 上智大学 東京理科大学
    明治大学 青山学院大学 立教大学 中央大学 法政大学 学習院大学
  )

  MATH_BOOK_NAME = %w(
    青チャートI+A 青チャートⅡ＋B 青チャートC
    黄チャートI+A 黄チャートⅡ＋B 黄チャートC
    やさしい理系数学 ハイレベル理系数学
    理系数学の良問プラチカ1A2B 理系数学の良問プラチカ3 文系数学の良問プラチカ1A2B
    新数学スタンダード演習1A2B 新数学スタンダード演習3
  )
  ENG_BOOK_NAME = %w(
    やっておきたい英語長文300 やっておきたい英語長文500 やっておきたい英語長文700 やっておきたい英語長文1000
  )
  PHY_BOOK_NAME = %w(
    物理のエッセンス 良問の風 名門の森 物理重要問題集 難問題の系統とその解き方
  )
  CHE_BOOK_NAME = %w(
    らくらくマスター化学基礎・化学 化学基礎問題精講 化学標準問題精講 化学の新演習
  )
  GENDAI_BOOK_NAME = %w(
    現代文読解力の開発講座
  )
  KOBUN_BOOK_NAME = %w(
    古文入門 古文上達基礎編 古文上達 入試精選問題集古文 漢文道場 入試精選問題集漢文
  )
  WH_BOOK_NAME = %w(
    実力をつける世界史100題 
  )
  JH_BOOK_NAME = %w(
    実力をつける日本史100題
  )
  GEO_BOOK_NAME = %w(
    実力をつける地理100題
  )
end
