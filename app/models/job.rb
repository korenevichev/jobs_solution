class Job < ActiveRecord::Base
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :shifts
  has_and_belongs_to_many :users

  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :salary_per_hour, :presence => true
  validates :languages, :presence => true
  validates :shifts, :presence => true
  validates :shifts, length: {
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
