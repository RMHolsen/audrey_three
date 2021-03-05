class List < ActiveRecord::Base 
    validates :name, presence: true 
    
    has_many :items 
    has_many :topics 
    has_many :projects, through: :topics 

    # def categories_attributes=(category_attributes)
    #     category_attributes.values.each do |category_attribute|
    #       category = Category.find_or_create_by(category_attribute)
    #       self.categories << category
    #     end
    #   end
end 