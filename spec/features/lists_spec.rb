require 'rails_helper'

describe 'lists', type: :feature do 

    describe 'show' do 
        before do 
            List.destroy_all 
            Item.destroy_all 
            @list = List.create!(name: "Queers In Early 20th Century US History")
            @vassar = @list.items.create!(name: "Wolf Girls at Vassar", material: "book", creator: "Anne MacKay")
            @underfire = @list.items.create!(name: "Coming Out Under Fire: The History of Gay Men and Women in World War Two", material: "book", creator: "Allan Berube")
            @memoir = @list.items.create!(name: "Naked in the Promised Land: A Memoir", material: "book", creator: "Lilian Faderman")

            @project = Project.create!(name: "The Colton Street Diaries")
            @topic = Topic.create!(name: "Hettie and Lena's Life and Marriage")
            @topic.list = @list 
            @topic.project = @project
            @topic.save 
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
                expect(page).to have_content('Naked in the Promised Land: A Memoir')
            end 
        end 

        it "shows all related projects for the list under the list name" do 
            visit list_path(@list)
            expect(page.status_code).to eq(200)
            expect(page).to have_content("The Colton Street Diaries - Hettie and Lena's Life and Marriage")
        end 

        it "shows the material type for each item" do 
            visit list_path(@list)
            expect(page).to have_content('book')
        end 

        it "index page shows the list names" do 
            visit lists_path 
            expect(page.status_code).to eq(200)
            expect(page).to have_content('Queers In Early 20th Century US History')
        end 

        it "index page shows the item count for each list" do 
            visit lists_path
            expect(page.status_code).to eq(200)
            expect(page).to have_content("3 items")
        end 

    end 

    describe 'new' do 

        before do 
            List.destroy_all 
            Item.destroy_all 
            @longroad = Project.create!(name: "The Long Road")
            @diaries = Project.create!(name: "The Colton Street Diaries")
            @topic1 = Topic.create!(name: "Act Four Background", project: @longroad)
            @topic2 = Topic.create!(name: "Background for Hettie and Lena", project: @diaries)
        end 

        it "creates a new list with a name" do 
            visit new_list_path
            fill_in('list_name', with: 'Early 20th Century US History')
            click_button('Create List')
            expect(page).to have_content('Early 20th Century US History')
        end 

        it "creates a new list associated with a topic" do 
            visit new_list_path
            fill_in('list_name', with: 'Early 20th Century US History')
            check('The Colton Street Diaries - Background for Hettie and Lena')
            click_button('Create List')
            expect(page).to have_content('Early 20th Century US History')
            expect(page).to have_content('The Colton Street Diaries - Background for Hettie and Lena')
        end 

        it "creates a new list associated with multiple topics" do 
            visit new_list_path 
            fill_in('list_name', with: 'Eartly 20th Century US History')
            check('The Colton Street Diaries - Background for Hettie and Lena')
            check('The Long Road - Act Four Background')
            click_button('Create List')
            expect(page.status_code).to eq(200)
            expect(page).to have_content('The Colton Street Diaries - Background for Hettie and Lena')
            expect(page).to have_content('The Long Road - Act Four Background')
        end 
    end 

    describe 'edit' do 
        before do 
            List.destroy_all 
            Item.destroy_all 
            @list = List.create!(name: 'Early 20th Century US History')
            @longroad = Project.create!(name: "The Long Road")
            @diaries = Project.create!(name: "The Colton Street Diaries")
            @lifestyles = Project.create!(name: "Lifestyles of the Witch and Famous")
            @topic1 = Topic.create!(name: "Act Four Background", project: @longroad)
            @topic2 = Topic.create!(name: "Background for Hettie and Lena", project: @diaries, list: @list)
            @topic3 = Topic.create!(name: "Sforza-Della Rovere Family History", project: @lifestyles, list: @list)
        end 

        it "can remove a project topic from a list" do 
            visit edit_list_path(@list)
            uncheck('Lifestyles of the Witch and Famous - Sforza-Della Rovere Family History')
            click_button('Update List')
            expect(page.status_code).to eq(200)
            expect(page).to have_content('The Colton Street Diaries - Background for Hettie and Lena')
            expect(page).not_to have_content('Lifestyles of the Witch and Famous - Sforza-Della Rovere Family History')
        end 

        it "can add a project topic to a list" do 
            visit edit_list_path(@list)
            check('The Long Road - Act Four Background')
            click_button('Update List')
            expect(page.status_code).to eq(200)
            expect(page).to have_content('The Long Road - Act Four Background')
            expect(page).to have_content('Lifestyles of the Witch and Famous - Sforza-Della Rovere Family History')
            expect(page).to have_content('The Colton Street Diaries - Background for Hettie and Lena')
        end 
    end 
end 

