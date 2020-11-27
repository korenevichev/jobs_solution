class Shift < ActiveRecord::Base
  attr_accessor :from, :to
  has_and_belongs_to_many :jobs
end
