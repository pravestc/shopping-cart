require "rails_helper"

RSpec.feature "Users can create new projects" do
  before do
    login_as(FactoryGirl.create(:user, :shopkeeper))
    visit "/"
    
    click_link "New Item"
  end
  
  scenario "with valid attributes" do
    fill_in "item_name_en" , with: "Radiance"
    fill_in "item_name_es", with: "Radiance"
    fill_in "item_price", with: "300"

    click_button "Create Item"

    expect(page).to have_content "Item has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Item"

    expect(page).to have_content "Item has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end
