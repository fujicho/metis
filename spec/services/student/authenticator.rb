require "rails_helper"

describe Student::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      m = build(:student_member)
      expect(Student::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "誤ったパスワードならfalseを返す" do
      m = build(:student_member)
      expect(Student::Authenticator.new(m).authenticate("aa")).to be_falsey
    end

    example "パスワードが未設定ならfalseを返す" do
      m = build(:student_member, password: nil)
      expect(Student::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    example "停止フラグが立っていればfalseを返す" do
      m = build(:student_member, suspended: true)
      expect(Student::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "入学日が明日ならfalseを返す" do
      m = build(:student_member, start_date: Date.tomorrow)
      expect(Student::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "卒業日を過ぎているならfalseを返す" do
      m = build(:student_member, graduation_date: Date.yesterday)
      expect(Student::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
  end
end