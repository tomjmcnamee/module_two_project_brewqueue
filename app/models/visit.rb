class Visit < ApplicationRecord
  belongs_to :user_brew_queue
  has_many :comments

  validates :event_name, presence: true
  validates :visit_date, presence: true 

end
