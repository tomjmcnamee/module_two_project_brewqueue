class User < ApplicationRecord
    has_many :user_brew_queues
    has_many :breweries, through: :user_brew_queues
    has_many :visits, through: :user_brew_queues  
    has_many :comments
    validates :first_name, presence: true
    validates :email_address, presence: true
    validates :password, presence: true
    validates :age, presence: true
    validate :age_cannot_be_under_21
    has_secure_password

    def age_cannot_be_under_21
        if age.present? && age.to_i < 21
            errors.add(:age, 'too low.  You must be over 21!')
        end
    end
    
end
