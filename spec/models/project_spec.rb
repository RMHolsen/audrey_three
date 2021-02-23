require 'rails_helper'

describe Project do 
    let (:attributes) do 
        {
            name: "The Broad Street Diaries: Book 1",
            description: "A pulp mystery novel starring investigating lesbians set in the 1950s, or possibly the 1930s, I haven't decided yet.",
            summary: "A very long summary goes here, but fortunately since there's no length requirements on it, I don't have to actually write it out."
        }
    end 

    let(:missing_name) { attributes.except(:name) }
    let(:missing_description) { attributes.except(:description) }
    let(:missing_summary) { attributes.except(:summary) }

    it 'is considered valid' do
      expect(Project.new(attributes)).to be_valid
    end
  
    it 'is considered valid without a description' do 
      expect(Project.new(missing_description)).to be_valid
    end 

    it 'is considered valid without a summary' do 
      expect(Project.new(missing_summary)).to be_valid
    end 

    it 'is invalid without a name' do 
        expect(Project.new(missing_name)).not_to be_valid 
    end 
end 