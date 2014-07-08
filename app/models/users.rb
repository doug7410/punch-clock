class User < ActiveRecord::Base
  attr_accessor :old_password

  has_many :jobs
  has_many :punches, through: :jobs
  
  has_secure_password validations: false
  validates :username, presence: :true, uniqueness: true
  validates :password, presence: :true, length: {minimum: 6}, on: :create

  validates :password, presence: :true, length: {minimum: 6}, on: :update,  if: :password_match?, allow_blank: true

  def password_match?
    current_password = BCrypt::Password.new(User.find(self.id).password_digest)
    
    if current_password == self.old_password || self.password.blank?
      true
    else
      errors.add(:password, "did not match.") unless errors[:password].include?("did not match.")
    end
  end

end