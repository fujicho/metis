require "rails_helper"

describe "次回から自動でログインする" do
  let(:student_member){ create(:student_member) }

  example "チェックボックスをオフにした場合"do
    post student_session_url,
      params: {
        student_login_form: {
          student_number: student_member.student_number,
          password: "password",
          remember_me: "0"
        }
      }

  expect(session).to have_key(:student_member_id)
  expect(response.cookies).not_to have_key("student_member_id")

  end
end

