require "rails_helper"

RSpec.feature "Users can create new projects" do
  before do
    login_as(FactoryGirl.create(:user, :shopkeeper))
    visit "/"
    
    click_link "New Item"
  end
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Radiance"
    fill_in "Legend", with: "A divine weapon that causes damage and a bright burning effect that lays waste to nearby enemies."
    fill_in "Effect", with: "Active: Toggle Burn - When active, scorches nearby enemies for 50 damage per second and blinds them, causing them to miss 17% of their attacks."
    fill_in "Stats", with: "+ 65 Damage
    BURN DAMAGE PER SECOND: 50
    BURN MISS CHANCE: 17%
    BURN RADIUS: 700"
    fill_in "Price", with: "300"

    click_button "Create Item"

    expect(page).to have_content "Item has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Item"

    expect(page).to have_content "Item has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end
