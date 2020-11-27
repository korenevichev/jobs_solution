class Job < ActiveRecord::Base
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :shifts
  has_and_belongs_to_many :users

  def total_salary
    total_hours = shifts.map do |shift|
      (shift.period.end - shift.period.begin) / 3600
    end.sum
    total_hours * salary_per_hour
  end
end
