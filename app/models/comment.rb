class Comment < ApplicationRecord
  belongs_to :visit
  belongs_to :user

  validates :user_id, presence: true
end
