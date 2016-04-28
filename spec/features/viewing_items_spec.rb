require "rails_helper"

RSpec.feature "Users can view items" do

  let!(:item) { FactoryGirl.create(:item, name: "Magic Stick", legend: "It's a really nice magic stick") }

  before do

    visit "/"
  end
  
  scenario "successfully in the summary" do
    expect(page).to have_content "Magic Stick"
  end

  scenario "with the project details" do
    click_link "Magic Stick"

    expect(page).to have_content "It's a really nice magic stick" 
  end
end
