class Shift < ActiveRecord::Base
  attr_accessor :from, :to
  has_and_belongs_to_many :jobs

  validates :from, presence: true, on: :create
  validates :to, presence: true, on: :create

  before_create :populate_period

  private

  def populate_period
    self.period = from..to
  end
end
