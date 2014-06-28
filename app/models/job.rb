class Job < ActiveRecord::Base
  has_many :punches
end