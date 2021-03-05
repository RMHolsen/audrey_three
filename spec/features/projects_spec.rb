require 'rails_helper'

describe 'projects', type: :feature do 
    before do 
        Project.destroy_all 
        Topic.destroy_all
        @bloodwives = Project.create!(name: "Bloodwives", description: "novel", summary: "Lesbian Robin Hood in the Viking era featuring a rather dippy Robin cross-gendering not out of a sense of gender dysphoria but to protect herself and hide her identity, and a much more competent Marian who is her ticket into the Danish world.")
        @lifestyles = Project.create!(name: "Lifestyles of the Witch and Famous", description: "novel", summary: "The Rochester sisters travel to Florence for their cousin's wedding, a grand event with several of the oldest and most powerful magical families in Europe in attendance. Also in attendance: a body-jumping tyrant, several murderers, and a young sorceress blinded by her own True Sight.")
        @florence = @lifestyles.topics.build(name: "Geography of Florence")
        @orthodox = @lifestyles.topics.build(name: "History of the Greek Orthodox Church")
        @hermetics = @lifestyles.topics.build(name: "Hermetic Magic Systems in the Mediterranean")
        @lifestyles.save

        @list = List.create!(name: "Mithraic Magic Systems")
        @list.topics << @hermetics 
        @list.save 
    end

    it "exists in a show page" do 
        visit project_path(@bloodwives)
        expect(page.status_code).to eq(200)
        expect(page).to have_content("Bloodwives")
    end 

    it "can add a topic to a project" do 
        visit project_path(@bloodwives)    
         fill_in('topic_name', with: 'Vikings')
         click_button('Create Topic')
         expect(@bloodwives.topics.count).to eq(1)
         expect(@bloodwives.topics.last.name).to eq('Vikings')
    end 

    it "displays the topics associated with a project" do 
        visit project_path(@lifestyles)
        expect(page.status_code).to eq(200)
        expect(page).to have_content("Geography of Florence")
        expect(page).to have_content("History of the Greek Orthodox Church")
    end 

    it "invites the user to create a wish list if none exists" do 
        visit project_path(@lifestyles)
        expect(page.status_code).to eq(200)
        expect(page).to have_link("Create a wish list for this topic", href: new_list_path)
    end 

    it "has a link to the wish list if a list exists" do 
        visit project_path(@lifestyles)
        expect(page.status_code).to eq(200)
        expect(page).to have_link("Mithraic Magic Systems", href: list_path(@list))
    end 
end 
    # create_table "projects", force: :cascade do |t|
    #     t.string   "name"
    #     t.string   "description"
    #     t.text     "summary"
    #     t.datetime "created_at",  null: false
    #     t.datetime "updated_at",  null: false
    #   end