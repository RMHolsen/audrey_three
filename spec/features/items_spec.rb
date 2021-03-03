require 'rails_helper'

describe 'items', type: :feature do 
    before do
        Item.destroy_all 
        List.destroy_all 
        @list = List.create!(name: "Queers In Early 20th Century US History")
        @vassar = @list.items.create!(name: "Wolf Girls at Vassar", material: "book", creator: "Anne MacKay")
        @underfire = @list.items.create!(name: "Coming Out Under Fire: The History of Gay Men and Women in World War Two", material: "book", creator: "Allan Berube")
    end 

    it "show page links to the list show page" do 
        visit list_item_path(@list, @vassar)
        expect(page.status_code).to eq(200)
        expect(page).to have_link(@list.name, href: list_path(@list))
    end 

    it "show page displays item title" do 
        visit list_item_path(@list, @vassar)
        expect(page.status_code).to eq(200)
        expect(page).to have_content(@vassar.name)
    end 

    it "show page displays item author or editor" do 
        visit list_item_path(@list, @vassar)
        expect(page.status_code).to eq(200)
        expect(page).to have_content(@vassar.creator)
    end 

    it "show page displays item type" do 
        visit list_item_path(@list, @vassar)
        expect(page.status_code).to eq(200)
        expect(page).to have_content(@vassar.material)
    end 

end 
# create_table "items", force: :cascade do |t|
#     t.string  "name"
#     t.string  "material"
#     t.string  "creator"
#     t.integer "publication_date"
#     t.integer "list_id"
#     t.index ["list_id"], name: "index_items_on_list_id"
#   end