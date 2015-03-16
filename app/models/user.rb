class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  validates :email, presence: true
  has_secure_password

  has_many :shares, foreign_key: 'from_user_id'
end