student = StudentMember.all
teacher = TeacherMember.all
question = Question.all

100.times do |n|
  Answer.create!(
    question: question.sample,
    teacher_member: teacher.sample,
    student_member: student.sample,
    body: "ここでベクトルa+bを二乗すればa,bの大きさがでてきますのでこれを代入して、fooを求めています。"
  )
end