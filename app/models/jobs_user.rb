class JobsUser < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :job_id
  belongs_to :user
  belongs_to :job
end
