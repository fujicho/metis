class Teacher::TopController < Teacher::Base
  def index
    render action: "index"
  end
end
