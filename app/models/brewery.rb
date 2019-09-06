class Brewery < ApplicationRecord
    has_many :user_brew_queues
    has_many :users, through: :user_brew_queues
    has_many :vists, through: :user_brew_queues
    has_many :comments, through: :visits

end
