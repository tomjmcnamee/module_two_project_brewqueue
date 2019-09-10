class User < ApplicationRecord
    has_many :user_brew_queues
    has_many :breweries, through: :user_brew_queues
    has_many :visits, through: :user_brew_queues  
    has_many :comments, through: :visits
    has_secure_password
end
