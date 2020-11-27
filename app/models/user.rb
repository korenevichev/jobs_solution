class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :jobs
  belongs_to :role

  before_validation :default_role

  def admin?
    role.name.eql?('admin')
  end

  private

  def default_role
    self.role = Role.find_by(name: 'member') if role.nil?
  end
end
