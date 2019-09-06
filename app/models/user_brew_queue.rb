class UserBrewQueue < ApplicationRecord
  belongs_to :brewery
  belongs_to :user
  has_many :visits
end
