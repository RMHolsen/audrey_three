class List < ActiveRecord::Base 
    validates :name, presence: true 
    
    has_many :items 
    has_many :topics 
    has_many :projects, through: :topics 
end 