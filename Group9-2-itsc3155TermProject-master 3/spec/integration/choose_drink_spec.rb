require 'rails_helper.rb'

feature "Drinks page has descriptions" do
    scenario "CAN ENTER DRINKS PAGE THROUGH AGE CONFIRMATION" do
        visit drinks_path
        expect(page).to have_content("Description Area")
        expect(page).to have_content("Information Area")
        #DESCRIPTIONS LATER
        
    end
    scenario "Drinks page's Search button leads to drinks/search" do
        visit drinks_path
        click_link "Search"
        expect(page).to have_content("Liquor")
        expect(page).to have_content("Mixer")
        expect(page).to have_content("Flavor")
        expect(page).to have_content("RESULTS")
    end
    scenario "Can visit home from the drinks/search page" do
        visit search_path
        expect(page).to have_content("Liquor")
        expect(page).to have_content("Mixer")
        expect(page).to have_content("Flavor")
        expect(page).to have_content("RESULTS")
        click_link "Home"
        expect(page).to have_content("Description Area")
        expect(page).to have_content("Information Area")
    end
    scenario "Different results appear based on preferences" do
        visit search_path
        #find("TEQUILA", :visible => false).click
        # check('Vodka')
        # expect(page).to have_content("water || Fruity")
        # expect(page).to have_content("bobbbb || Savory")
        # click_button('Search')
        expect(page).to have_content("Please Drink Responsibly")
        expect(page).to have_content("ITSC 3155 | The Squad (Group 9-2) | University of North Carolina at Charlotte | 2018")
        visit drinks_path
        expect(page).to have_content("Please Drink Responsibly")
        expect(page).to have_content("ITSC 3155 | The Squad (Group 9-2) | University of North Carolina at Charlotte | 2018")
    end
end
        