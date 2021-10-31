Rails.application.configure do
  config.metis = {
    teacher: { host: "heroku-metista.heroku.com", path: "" },
    student: { host: "metis.example.com", path: "mypage"}
  }
end