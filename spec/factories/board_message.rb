FactoryBot.define do
  factory :board_message do
    association :teacher_member
    subject {"夏季講習開催のお知らせ"}
    body {"8/1~8/5に国公立理系を志望とする方への夏季講習会を行います。\r
      テスト＋解説講義の形式になり予習等は不要です。\r
      クラス分けは4月以降の模試の成績を考慮して行います。\r参加希望の方は担任に申し出てください。"}
    tag { "理系" }
  end
end