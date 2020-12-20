require "date"

city_names = %w(札幌市 川崎市 高崎市)

family_names = %w{
  竹丸:タケマル:takemaru
  金子:カネコ:kaneko
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
  貴志:タカシ:takashi
  夏希:ナツキ:natsuki
  未悠:ミユ:miyu
  瑠巳:ルミ:rumi
  奈々美:ナナミ:nanami
  友香:ユカ:yuka
}




10.times do |n|
  10.times do |m|
    
    birth_day = Random.rand(Date.parse("2003/04/02") .. Date.parse("2006/04/01"))
    studentnum = sprintf("%010d", n*10+m)
    fn = family_names[n].split(":")
    gn = given_names[m].split(":")
    
    def grade(birth_day)
      if birth_day.between?( Date.parse("2003/04/02") , Date.parse("2004/04/01") ) 
        3
      elsif birth_day.between?( Date.parse("2004/04/02") , Date.parse("2005/04/01") )
        2
      else
        1
      end
    end

    def start_year(birth_day)
      if birth_day.between?( Date.parse("2003/04/02") , Date.parse("2004/04/01") ) 
        Date.parse("2018/04/01")
      elsif birth_day.between?( Date.parse("2004/04/02") , Date.parse("2005/04/01") )
        Date.parse("2019/04/01")
      else
        Date.parse("2020/04/01")
      end
    end

    def graduation_date(birth_day)
      if birth_day.between?( Date.parse("2003/04/02") , Date.parse("2004/04/01") ) 
        Date.parse("2021/03/31")
      elsif birth_day.between?( Date.parse("2004/04/02") , Date.parse("2005/04/01") )
        Date.parse("2022/03/31")
      else
        Date.parse("2023/03/31")
      end
    end

    c = StudentMember.create!(
      student_number: studentnum,
      email: "#{fn[2]}.#{gn[2]}@example.jp",
      family_name: fn[0],
      given_name: gn[0],
      family_name_kana: fn[1],
      given_name_kana: gn[1],
      gender: m < 5 ? "male" : "female",
      telephone_number: "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}",
      emergency_contact: "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}",
      a_class: rand(1..3),
      homeroom_teacher: "藤田",
      password: "password",
      birth_day: birth_day,
      grade: grade(birth_day),
      suspended: n == 1,
      start_date: start_year(birth_day),
      graduation_date: graduation_date(birth_day)
    )

    c.create_home_address!(
      postal_code: sprintf("%07d",rand(1000000)),
      prefecture: StudentMemberAddress::PREFECTURE_NAMES.sample,
      city: city_names.sample,
      address1: "中央区中央町1-2-3",
      address2: "コーポボステリ102",
    )
    if m % 3 == 0
      c.create_parents_address!(
        postal_code: sprintf("%07d",rand(1000000)),
        prefecture: StudentMemberAddress::PREFECTURE_NAMES.sample,
        city: city_names.sample,
        address1: "南区南町3-13",
        address2: "パーク実家407",
      )
    end
  end
end