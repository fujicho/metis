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

  example "チェックボックスをオンにした場合" do
    post student_session_url,
    params: {
      student_login_form: {
        student_number: student_member.student_number,
        password: "password",
        remember_me: "1"
      }
    }
    expect(session).not_to have_key(:student_member_id)
    expect(response.cookies["student_member_id"]).to match(/[0-9a-f]{40}\z/)

    cookies = response.request.env["action_dispatch.cookies"]
      .instance_variable_get(:@set_cookies)

    expect(cookies["student_member_id"][:expires]).to be > 19.years.from_now
  end
end

