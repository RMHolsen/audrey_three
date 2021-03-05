class Project < ActiveRecord::Base 
    validates :name, presence: true 
    
    has_many :topics
    has_many :lists, through: :topics 
    accepts_nested_attributes_for :lists
    belongs_to :user 
end 