Rails.application.configure do
  if Rails.env.production?
    config.metis = {
      teacher: { host: "heroku-metista.herokuapp.com", path: "teacher" },
      student: { host: "heroku-metista.herokuapp.com", path: "mypage"}
    }
  else
    config.metis = {
      teacher: { host: "example.com", path: "" },
      student: { host: "metis.example.com", path: "mypage"}
    }
  end
end