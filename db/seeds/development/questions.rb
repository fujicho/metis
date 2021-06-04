book = Book.all
student = StudentMember.all

100.times do |n|
  Question.create!(
    student_member: student.sample,
    book: book.sample,
    subject: book.sample.book_subject,
    title: "この問題の#{n}行目がわかりません。",
    body: "hogeがfugaになる、というところまではわかるのですが、そのあとのfooがどうしてbarになるのかがよくわかりませんでした。教科書で該当箇所を探してみましたが、いまいち理解が深まりませんでした。",
  )
end