StudentMember.create!(
  student_number: "00000000",
  family_name: "藤田",
  given_name: "太郎",
  family_name_kana: "フジタ",
  given_name_kana: "タロウ",
  emergency_contact: "00000000000",
  start_date: Date.today,
  password: "password"
)

family_names = %w{
  本田:ホンダ:honda
  吉富:ヨシトミ:yoshitomi
  華山:ハナヤマ:hanayama
  國谷:クニヤ:kuniya
  小林:コバヤシ:kobayashi
  西村:ニシムラ:nishimura
  稲川:イナガワ:inagawa
  榊:サカキ:sakaki
}

given_names = %w{
  英三郎:エイサブロウ:eisaburo
  健二郎:ケンジロウ:kenjiro
  浩紀:ヒロキ:hiroki
  誠:マコト:makoto
  夏希:ナツキ:natsuki
  未悠:ミユ:miyu
  友香:ユカ:yuka
}

56.times do |n|
  fn = family_names[n % 8].split(":")
  gn = given_names[n % 7].split(":")

  StudentMember.create!(
    student_number: "0000000#{n}",
    family_name: fn[0],
    given_name: gn[0],
    family_name_kana: fn[1],
    given_name_kana: gn[1],
    password: "password",
    emergency_contact: "03xxxxxxxx",
    start_date: (100 - n).days.ago.to_date,
    suspended: n == 1,
    grade: rand(1..3),
    a_class: rand(1..3)
  )
end