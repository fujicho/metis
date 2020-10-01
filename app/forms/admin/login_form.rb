class Admin::LoginForm
  include ActiveModel::Model

  attr_accessor :admin_number, :password
end