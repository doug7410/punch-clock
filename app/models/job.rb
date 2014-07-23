class Job < ActiveRecord::Base
  has_many :punches
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :name, presence: true
  validates :description, presence: true

  after_create :set_status


  def set_status
    self.status = true
  end
end