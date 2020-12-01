class Job < ApplicationRecord
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :shifts
  has_many :jobs_users
  has_many :users, through: :jobs_users

  validates :title, presence: true, uniqueness: true
  validates :salary_per_hour, presence: true
  validates :languages, presence: true
  validates :shifts, presence: true, length: {
    maximum: 7,
    message: 'A job can only have a maximum of 7 shifts'
  }

  def total_salary
    total_hours = shifts.map do |shift|
      (shift.period.end - shift.period.begin) / 3600
    end.sum
    total_hours * salary_per_hour
  end
end
