class Topic < ActiveRecord::Base 
    belongs_to :project 
    belongs_to :list 

    def test_name 
        self.name 
    end 

    def name_with_project 
        "#{self.project.name} - #{self.name}"
    end 
end 