require "rails_helper"

describe Teacher::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      m = build(:teacher_member)
      expect(Teacher::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "誤ったパスワードならfalseを返す" do
      m = build(:teacher_member)
      expect(Teacher::Authenticator.new(m).authenticate("aa")).to be_falsey
    end

    example "パスワードが未設定ならfalseを返す" do
      m = build(:teacher_member, password: nil)
      expect(Teacher::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    example "停止フラグが立っていればfalseを返す" do
      m = build(:teacher_member, suspended: nil)
      expect(Teacher::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "入職日が明日ならfalseを返す" do
      m = build(:teacher_member, start_date: Date.tomorrow)
      expect(Teacher::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "退職日を過ぎているならfalseを返す" do
      m = build(:teacher_member, end_date: Date.yesterday)
      expect(Teacher::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
  end
end