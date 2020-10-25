require "rails_helper"

describe "管理者による職員管理","ログイン前" do
  include_examples "a protected teacher controller","teacher/student_members"
end

describe "教職員による生徒管理" do
  let(:teacher_member){ create(:teacher_member)}

  before do
    post teacher_session_url
      params: {
        teacher_login_form: {
          email: member0@example.com,
          password: "pw"
        }
      }
  end

  describe "新規登録" do
    let(:params_hash){ attributes_for(:student_member)}

    example "生徒一覧にリダイレクト" do
      post teacher_student_members_url, params:{ student_member: params_hash}
      expect(response).to redirect_to(teacher_student_members_url)
    end

    example "例外 ActionController::ParameterMissingが発生" do
      expect { post teacher_student_members_url}.
        to raise_error(ActionController::ParameterMissing)
    end

  end

  describe "更新" do
    let(:student_member){ create(:student_member)}
    let(:params_hash){ attributes_for(:student_member)}
    
    example "suspendedフラグをセットする" do
      params_hash.merge!(suspended: true)
      patch teacher_student_member_url(student_member),
        params: { student_member: params_hash}
      student_member.reload
      expect(student_member).to be_suspended
    end

    example "hashed_passwordの書き換え不可" do
      params_hash.delete(:password)
      params_hash.merge!(hashed_password: "abc")
      expect{ patch teacher_student_member_url(student_member),
        params: { student_member: params_hash}
      }.not_to change{ student_member.hashed_password.to_s}
    end
  end
end