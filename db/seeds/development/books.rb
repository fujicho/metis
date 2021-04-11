math = %w(
  青チャートI+A 青チャートⅡ＋B 青チャートC
  黄チャートI+A 黄チャートⅡ＋B 黄チャートC
  やさしい理系数学 ハイレベル理系数学
  理系数学の良問プラチカ1A2B 理系数学の良問プラチカ3 文系数学の良問プラチカ1A2B
  新数学スタンダード演習1A2B 新数学スタンダード演習3
)
eng = %w(
  やっておきたい英語長文300 やっておきたい英語長文500 やっておきたい英語長文700 やっておきたい英語長文1000
)
phy = %w(
  物理のエッセンス 良問の風 名門の森 物理重要問題集 難問題の系統とその解き方
)
che = %w(
  らくらくマスター化学基礎・化学 化学基礎問題精講 化学標準問題精講 化学の新演習
)
gendai = %w(
  現代文読解力の開発講座
)
koten = %w(
  古文入門 古文上達基礎編 古文上達 入試精選問題集古文 漢文道場 入試精選問題集漢文
)
wh = %w(
  実力をつける世界史100題 
)
jh = %w(
  実力をつける日本史100題
)
geo = %w(
  実力をつける地理100題
)

univ = %w(
  北海道大学 東北大学 東京大学 名古屋大学 京都大学 大阪大学 九州大学
  一橋大学 東京工業大学
  早稲田大学 慶應義塾大学 上智大学 東京理科大学
  明治大学 青山学院大学 立教大学 中央大学 法政大学 学習院大学
)

subject = %w(
  数学 英語 国語 物理 化学 生物 世界史 日本史 地理 古典  
)

13.times do |n|
  WorkBook.create!(
    book_name: math[n],
    book_subject: "数学",
  )
end

4.times do |n|
  WorkBook.create!(
    book_name: eng[n],
    book_subject: "英語",
  )
end

5.times do |n|
  WorkBook.create!(
    book_name: phy[n],
    book_subject: "物理",
  )
end

4.times do |n|
  WorkBook.create!(
    book_name: che[n],
    book_subject: "化学",
  )
end

WorkBook.create!(
  book_name: gendai[0],
  book_subject: "現代文"
)

6.times do |n|
  WorkBook.create!(
    book_name: koten[n],
    book_subject: "古典",
  )
end

WorkBook.create!(
  book_name: wh[0],
  book_subject: "世界史"
)

WorkBook.create!(
  book_name: jh[0],
  book_subject: "日本史"
)

WorkBook.create!(
  book_name: geo[0],
  book_subject: "地理"
)

19.times do |n|
  21.times do |m|
    10.times do |l|
      PastBook.create!(
        book_name: univ[n],
        book_year: 1990+m,
        book_subject: subject[l]
      )
    end
  end
end