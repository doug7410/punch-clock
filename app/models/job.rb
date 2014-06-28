class Job < ActiveRecord::Base
  has_many :punches

  validates :name, presence: true
  validates :description, presence: true
end