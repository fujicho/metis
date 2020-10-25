require "rails_helper"

describe "教職員による自分のアカウント管理","ログイン前" do
  include_examples "a protected singular teacher controller","teacher/accounts"
end

describe "教職員による自身のアカウント管理" do
  before do
    post teacher_session_url,
      params: {
        teacher_login_form: {
          email: teacher_member.email,
          password: "pw"
        }
      }
  end

  describe "情報表示" do
    let(:teacher_member){create(:teacher_member)}

    example "成功" do
      get teacher_account_url
      expect(response.status).to eq(200)
    end

    example "停止フラグがセットされたら強制的にログアウト" do
      teacher_member.update_column(:suspended, true)
      get teacher_account_url
      expect(response).to redirect_to(:teacher_root)
    end
  end

  describe "更新" do
    let(:params_hash){attributes_for(:teacher_member)}
    let(:teacher_member){create(:teacher_member)}

    example "emailを変更する" do
      params_hash.merge!(email: "spec@example.com")
      patch teacher_account_url,
        params: { id: teacher_member.id ,teacher_member: params_hash}
        teacher_member.reload
        expect(teacher_member.email).to eq("spec@example.com")
    end

    example "例外(ActionController::ParameterMissing)の発生" do
      expect{ patch teacher_account_url, params: { id: teacher_member.id }}.
      to raise_error(ActionController::ParameterMissing)
    end

    example "end_dateの書き換えは不可" do
      params_hash.merge!(end_date: Date.tomorrow)
      expect { patch teacher_account_url,
        params: {id: teacher_member.id, teacher_member: params_hash }
      }.not_to change{ teacher_member.end_date}
    end
  end
end