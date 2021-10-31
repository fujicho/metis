Rails.application.configure do
  config.metis = {
    teacher: { host: "heroku-metista.herokuapp.com", path: "" },
    student: { host: "metis.example.com", path: "mypage"}
  }
end