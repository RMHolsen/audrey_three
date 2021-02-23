class Item < ActiveRecord::Base 
    validates :name, :material, presence: true 
    #Must have a name and material so we know what we're looking for if we need to Google.

    belongs_to :list 
    has_many :item_sources
    has_many :sources, through: :item_sources 
end 