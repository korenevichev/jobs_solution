User.create!([
  {email: "test_admin@mail.com", encrypted_password: "$2a$12$opXFlFG8H6XpTBkZ4rlma.B5U5vLixxX6n/dMHlpb.WIOdTdS2d66", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role_id: 1},
  {email: "test_user@mail.com", encrypted_password: "$2a$12$9Ck8gB3utFNmv53Jciw9WeiZzcWiJ/6BUSjdTnkZ9IwRtK4jUCD8i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role_id: 2}
])
JobsUser.create!([
  {user_id: 5, job_id: 1},
  {user_id: 5, job_id: 1},
  {user_id: 6, job_id: 1}
])
User::HABTM_Jobs.create!([
  {user_id: 5, job_id: 1},
  {user_id: 5, job_id: 1},
  {user_id: 6, job_id: 1}
])
Language.create!([
  {name: "English"},
  {name: "German"},
  {name: "Spanish"},
  {name: "Japanese"}
])
Language::HABTM_Jobs.create!([
  {job_id: 1, language_id: 1},
  {job_id: 1, language_id: 2},
  {job_id: 10, language_id: 1},
  {job_id: 10, language_id: 2},
  {job_id: 10, language_id: 3},
  {job_id: 11, language_id: 1},
  {job_id: 11, language_id: 2},
  {job_id: 11, language_id: 3},
  {job_id: 12, language_id: 1},
  {job_id: 14, language_id: 1},
  {job_id: 15, language_id: 1},
  {job_id: 16, language_id: 4},
  {job_id: 17, language_id: 4},
  {job_id: 18, language_id: 4}
])
Shift.create!([
  {period: "[2020-11-26 07:00:00 UTC,2020-11-26 15:00:00 UTC]"},
  {period: "[2020-11-27 07:00:00 UTC,2020-11-27 11:00:00 UTC]"},
  {period: "[2020-11-27 11:00:00 UTC,2020-11-27 13:00:00 UTC]"},
  {period: "[2020-11-27 15:00:00 UTC,2020-11-27 19:00:00 UTC]"},
  {period: "[2020-11-28 07:00:00 UTC,2020-11-28 09:00:00 UTC]"},
  {period: "[2020-11-28 09:00:00 UTC,2020-11-28 13:00:00 UTC]"},
  {period: "[2020-11-28 11:00:00 UTC,2020-11-28 19:00:00 UTC]"},
  {period: "[2020-11-29 11:00:00 UTC,2020-11-29 19:00:00 UTC]"}
])
Shift::HABTM_Jobs.create!([
  {job_id: 15, shift_id: 3},
  {job_id: 16, shift_id: 2},
  {job_id: 16, shift_id: 3},
  {job_id: 17, shift_id: 2},
  {job_id: 1, shift_id: 14},
  {job_id: 14, shift_id: 15},
  {job_id: 14, shift_id: 17},
  {job_id: 14, shift_id: 19},
  {job_id: 18, shift_id: 16},
  {job_id: 18, shift_id: 20},
  {job_id: 18, shift_id: 21}
])
Role.create!([
  {name: "admin"},
  {name: "member"}
])
Job.create!([
  {title: "Job 1", salary_per_hour: "10.0"},
  {title: "Job 3", salary_per_hour: "20.0"},
  {title: "Job 2", salary_per_hour: "8.0"}
])
Job::HABTM_Languages.create!([
  {job_id: 1, language_id: 1},
  {job_id: 1, language_id: 2},
  {job_id: 10, language_id: 1},
  {job_id: 10, language_id: 2},
  {job_id: 10, language_id: 3},
  {job_id: 11, language_id: 1},
  {job_id: 11, language_id: 2},
  {job_id: 11, language_id: 3},
  {job_id: 12, language_id: 1},
  {job_id: 14, language_id: 1},
  {job_id: 15, language_id: 1},
  {job_id: 16, language_id: 4},
  {job_id: 17, language_id: 4},
  {job_id: 18, language_id: 4}
])
Job::HABTM_Shifts.create!([
  {job_id: 15, shift_id: 3},
  {job_id: 16, shift_id: 2},
  {job_id: 16, shift_id: 3},
  {job_id: 17, shift_id: 2},
  {job_id: 1, shift_id: 14},
  {job_id: 14, shift_id: 15},
  {job_id: 14, shift_id: 17},
  {job_id: 14, shift_id: 19},
  {job_id: 18, shift_id: 16},
  {job_id: 18, shift_id: 20},
  {job_id: 18, shift_id: 21}
])
