require "rails_helper"

describe "教職員による生徒管理" do
  let(:teacher_member){ create(:teacher_member)}

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

  # describe "更新" do
  #   let(:student_member){ create(:student_member)}
  #   let(:params_hash){ attributes_for(:student_member)}


  # end
end