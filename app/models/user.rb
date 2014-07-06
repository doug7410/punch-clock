class User < ActiveRecord::Base
  has_many :jobs
  has_many :punches, through: :jobs

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, on: :create 
end