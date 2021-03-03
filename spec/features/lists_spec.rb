require 'rails_helper'

describe 'lists', type: :feature do 
    before do 
        List.destroy_all 
        Item.destroy_all 
        @list = List.create!(name: "Queers In Early 20th Century US History")
        @vassar = @list.items.create!(name: "Wolf Girls at Vassar", material: "book", creator: "Anne MacKay")
        @underfire = @list.items.create!(name: "Coming Out Under Fire: The History of Gay Men and Women in World War Two", material: "book", creator: "Allan Berube")
    end 

    it "shows page links to the list items by title" do 
        visit list_path(@list)
        expect(page.status_code).to eq(200)
        expect(page).to have_link('Wolf Girls at Vassar', href: list_item_path(@list, @vassar))
    end 

    it "lists all of the list's items" do 
        visit list_path(@list)
        within('ul') do 
            expect(page).to have_content('Wolf Girls at Vassar')
            expect(page).to have_content('Coming Out Under Fire: The History of Gay Men and Women in World War Two')
        end 
    end 

    it "index page lists the list names" do 
        visit lists_path 
        expect(page.status_code).to eq(200)
        expect(page).to have_content('Queers In Early 20th Century US History')
    end 

    it "shows the material type for each item" do 
        visit list_path(@list)
        expect(page).to have_content('book')
    end 
end 

# create_table "lists", force: :cascade do |t|
#     t.string   "name"
#     t.boolean  "public",     default: false
#     t.datetime "created_at",                 null: false
#     t.datetime "updated_at",                 null: false
#   end
