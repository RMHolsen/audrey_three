require 'rails_helper'

describe 'sources', type: :feature do 
    describe 'new' do 
        # before do 
        #     List.destroy_all 
        #     Item.destroy_all 
        #     @list = List.create!(name: 'Courtesan School')
        #     @item = Item.create!(name: 'The Book of the Courtesans', material: 'book')
        # end 

        it "says nothing when the source is free to access" do 
            visit new_source_path
            fill_in('source_name', with: 'DC Cleveland Park Library')
            fill_in('source_location', with: 'Connecticut Avenue - 3300 block')
            uncheck('source_fee')
            click_button('Create Source')
            expect(page.status_code).to eq(200)
            expect(page).to have_content('DC Cleveland Park Library')
            expect(page).to have_content('Connecticut Avenue - 3300 block')
            expect(page).not_to have_content('There is a fee.')
        end 

        it "says 'there is a fee' when the source is a store or behind a paywall" do 
            visit new_source_path 
            fill_in('source_name', with: 'Politics and Prose')
            fill_in('source_location', with: 'Connecticut Avenue - 5000 block')
            click_button('Create Source')
            expect(page.status_code).to eq(200)
            expect(page).to have_content('Politics and Prose')
            expect(page).to have_content('Connecticut Avenue - 5000 block')
            expect(page).to have_content('There is a fee.')
        end 

        # it "can be created from the item page" do 
        #     visit list_item_path(@list, @item)
        #     fill_in('source_name', with: 'DC Cleveland Park Libray')
        #     fill_in('source_location', with: 'Connecticut Street - 3300 block')
        #     click_button('Create Source')
        # end 
    end 

    describe 'show' do 
    end 
end 