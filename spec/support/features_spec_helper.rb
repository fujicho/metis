module FeaturesSpecHelper
  def switch_namespace(namespace)
    config = Rails.application.config.metis
    Capybara.app_host = "http://" + config[namespace][:host]
  end

  def login_as_teacher_member(teacher_member,password = "password")
    visit teacher_login_path
    within(".login-form") do
      fill_in "メールアドレス", with: teacher_member.email
      fill_in "パスワード", with: password
      click_button "ログイン"
    end
  end

  def login_as_student_member(student_member,password = "password")
    visit student_login_path
    within(".login-form") do
      fill_in "学生ID", with: student_member.student_number
      fill_in "パスワード", with: password
      click_button "ログイン"
    end
  end
end