require 'rails_helper'

RSpec.describe TeacherMember, type: :model do
  describe "#password=" do
    example "文字列を与えるとhashed_passwordは長さ60の文字列になる" do
      member = TeacherMember.new
      member.password = "password"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example "nilを与えると、hashed_passwordはnilになる"do
      member = TeacherMember.new(hashed_password: "hohohoge")
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
