require 'rails_helper'

describe User do 
    let (:attributes) do 
        {
            username: "junoreactor666",
            profile: "A totally fake profile for a totally fake user.",
            password: "12345"
        }
    let(:missing_username) { attributes.except(:username) }
    let(:missing_profile) { attributes.except(:profile) }
    end 

    it 'is considered valid' do 
        expect(User.new(attributes)).to be_valid
    end 

    it 'is considered valid without a profile' do 
        expect(User.new(missing_profile)).to be_valid
    end 

    it 'is invalid without a username' do 
        expect(User.new(missing_username)).not_to be_valid
    end 
end 