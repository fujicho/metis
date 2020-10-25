Rails.application.configure do
  config.metis = {
    teacher: { host: "metis.example.com", path: "" },
    admin: { host: "metis.example.com", path: "admin"},
    student: { host: "metis.example.com", path: "mypage"}
  }
end