class Item < ActiveRecord::Base 
    validates :name, :material, presence: true 
    #Must have a name and material so we know what we're looking for if we need to Google.

    belongs_to :list 
    has_many :item_sources
    has_many :sources, through: :item_sources 

    def sources_attributes=(source_attributes)
        source_attributes.values.each do |source_attribute|
          source = Source.find_or_create_by(source_attribute)
          self.item_sources.build(source: source)
        end
    end
end 