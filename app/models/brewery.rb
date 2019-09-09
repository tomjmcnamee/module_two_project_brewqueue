class Brewery < ApplicationRecord
    has_many :user_brew_queues
    has_many :users, through: :user_brew_queues
    has_many :vists, through: :user_brew_queues
    has_many :comments, through: :visits
    validates :name, presence: true
    
    def self.search_for_brewery(name, city, state)
      result_objs_arr = []
      Brewery.all.each do |brewery|
        if state == ""
          if brewery.name.downcase.include?(name) && brewery.city.downcase.include?(city)
            result_objs_arr << brewery
          end # Ends IF string
        else
          if brewery.name.downcase.include?(name) && brewery.city.downcase.include?(city) && brewery.state == state
            result_objs_arr << brewery
          end # ends IF string
        end  # ends IF Statement about a "" state
      end  # ends brewery.all.each loop
      result_objs_arr
    end

    def self.list_all_valid_states
        Brewery.select(:state).map { |rec| rec.state }.uniq
    end
end
