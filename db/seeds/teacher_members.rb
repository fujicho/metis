
city_names = %w(札幌市 川崎市 高崎市)

family_names = %w{
  藤田:フジタ:fujita
  鈴木:スズキ:suzuki
  高橋:タカハシ:takahashi
  田中:タナカ:tanaka
  渡辺:ワタナベ:watanabe
  関:セキ:seki
  山本:ヤマモト:yamamoto
  松土:マツド:matsudo
  小林:コバヤシ:kobayashi
  加藤:カトウ:kato
}

given_names = %w{
  壮平:ソウヘイ:sohei
  修平:シュウヘイ:shuhei
  哲平:テッペイ:teppei
  幸平:コウヘイ:kouhei
  一平:イッペイ:ippei
  愛果:アイカ:aika
  恵理華:エリカ:erika
  彩加:サヤカ:sayaka
  奈々香:ナナカ:nanaka
  万理華:マリカ:marika
}

10.times do |n|
  10.times do |m|
    fn = family_names[n].split(":")
    gn = given_names[m].split(":")

    c = TeacherMember.create!(
      email: "#{fn[2]}.#{gn[2]}@example.jp",
      family_name: fn[0],
      given_name: gn[0],
      family_name_kana: fn[1],
      given_name_kana: gn[1],
      password: "password",
      birthday: 60.years.ago.advance(seconds:rand(40.years)).to_date,
      gender: m < 5 ? "male" : "female",
      start_date: Date.today,
      subject: m < 5 ? "数学" : "英語",
      guest: false,
    )

    c.create_address!(
      postal_code: sprintf("%07d",rand(1000000)),
      prefecture: Address::PREFECTURE_NAMES.sample,
      city: city_names.sample,
      address1: "中央区中央町1-2-3",
      address2: "コーポボステリ102",
    )
  end
end

g = TeacherMember.create!(
  email: "guest@example.jp",
  password: "examplepass",
  family_name: "ゲスト",
  given_name: "ゲスト",
  family_name_kana: "ゲスト",
  given_name_kana: "ゲスト",
  birthday: 60.years.ago.advance(seconds:rand(40.years)).to_date,
  gender: "male",
  start_date: Date.today,
  subject: "数学",
  guest: true,
)
g.create_address!(
  postal_code: sprintf("%07d",rand(1000000)),
  prefecture: Address::PREFECTURE_NAMES.sample,
  city: city_names.sample,
  address1: "中央区中央町1-2-3",
  address2: "コーポつよし102",
)