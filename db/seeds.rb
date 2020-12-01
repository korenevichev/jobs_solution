ActiveRecord::Base.transaction do
  Role.create!([
     {id: 1, name: "admin"},
     {id: 2, name: "member"}
   ])
  User.create!([
    {email: "test_admin@mail.com", password: '123456', encrypted_password: "$2a$12$opXFlFG8H6XpTBkZ4rlma.B5U5vLixxX6n/dMHlpb.WIOdTdS2d66", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role_id: 1},
    {email: "test_user@mail.com", password: '123456', encrypted_password: "$2a$12$9Ck8gB3utFNmv53Jciw9WeiZzcWiJ/6BUSjdTnkZ9IwRtK4jUCD8i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role_id: 2}
  ])
  Shift.create!([
    {id: 1, from: "2020-11-26 07:00:00 UTC", to: "2020-11-26 15:00:00 UTC"},
    {id: 2, from: "2020-11-27 07:00:00 UTC", to: "2020-11-27 11:00:00 UTC"},
    {id: 3, from: "2020-11-27 11:00:00 UTC", to: "2020-11-27 13:00:00 UTC"},
    {id: 4, from: "2020-11-27 15:00:00 UTC", to: "2020-11-27 19:00:00 UTC"},
    {id: 5, from: "2020-11-28 07:00:00 UTC", to: "2020-11-28 09:00:00 UTC"},
    {id: 6, from: "2020-11-28 09:00:00 UTC", to: "2020-11-28 13:00:00 UTC"},
    {id: 7, from: "2020-11-28 11:00:00 UTC", to: "2020-11-28 19:00:00 UTC"},
    {id: 8, from: "2020-11-29 11:00:00 UTC", to: "2020-11-29 19:00:00 UTC"}
  ])
  Language.create!([
    {id: 1, name: "English"},
    {id: 2, name: "German"},
    {id: 3, name: "Spanish"},
    {id: 4, name: "Japanese"}
  ])
  Job.create!([
    {id: 1, title: "Job 1", salary_per_hour: "10.0", languages: Language.where(id: [1, 2]), shifts: Shift.where(id: [1])},
    {id: 2, title: "Job 2", salary_per_hour: "20.0", languages: Language.where(id: [1]), shifts: Shift.where(id: [2,5,6,8])},
    {id: 3, title: "Job 3", salary_per_hour: "8.0", languages: Language.where(id: [3, 4]), shifts: Shift.where(id: [4,7])}
  ])
end
