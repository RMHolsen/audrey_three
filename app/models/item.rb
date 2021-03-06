class Item < ActiveRecord::Base 
    validates :name, :material, presence: true 
    #Must have a name and material so we know what we're looking for if we need to Google.

    belongs_to :list 
    has_many :item_sources
    has_many :sources, through: :item_sources 
    #Item belongs on a list, only one list per item to keep things simpler
    #Item can have many sources, though, because you can read a book digitally or via physical movie, or listen to it, etc.
    #You can download a movie from streaming or purchase it on DVD or... etc.

    # def sources_attributes=(source_attributes)
    #     source_attributes.values.each do |source_attribute|
    #       source = Source.find_or_create_by(source_attribute)
    #       self.item_sources.build(source: source)
    #     end
    # end

    # Not using this right now, creating a source from the source-new page, but maybe in the future.

end 