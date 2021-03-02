require "rails_hepler"

feature "教職員による掲示板投稿" do
  include FeaturesSpecHelper
  let(:teacher_member) { create(:teacher_member) }

  before do
    swticth_namespace(:teacher)
    login_as_teacher_member(teacher_member)
  end
end