teacher_members = TeacherMember.all

tags = %w(文系 理系 全体)

subject = %w(講習会のお知らせ 臨時休校のお知らせ 新教室棟建築のお知らせ)

100.times do |n|
  c = BoardMessage.create!(
    subject: "#{subject.sample}",
    tag: tags.sample,
    body: "サンプル本文サンプル本文サンプル本文サンプル
      本文サンプル本文サンプル本文サンプル本文サンプル本文
      サンプル本文サンプル本文サンプル本文サンプル本文
      サンプル本文サンプル本文サンプル本文サンプル本文
      サンプル本文#{n}",
    teacher_member: teacher_members.sample
    )
end