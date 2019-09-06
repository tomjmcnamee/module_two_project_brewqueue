class Visit < ApplicationRecord
  belongs_to :user_brew_queue
  has_many :comments
end
