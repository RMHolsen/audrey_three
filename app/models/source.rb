class Source < ActiveRecord::Base 
    validates :name, :location, presence: true 
    #validates :fee, not sure how to do boolean validations 
    
    has_many :item_sources 
    has_many :items, through: :item_sources 
end 