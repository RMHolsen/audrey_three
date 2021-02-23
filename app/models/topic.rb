class Topic < ActiveRecord::Base 
    belongs_to :project 
    belongs_to :list 
end 