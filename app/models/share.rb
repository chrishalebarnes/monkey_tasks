class Share < ActiveRecord::Base
  validates :from_user_id, :to_user_id, presence: true
  belongs_to :user, foreign_key: :from_user_id
end
