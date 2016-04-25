require "rails_helper"

RSpec.feature "Users can view items" do

  let!(:item) { FactoryGirl.create(:item, name: "Magic Stick") }

  before do

    visit "/"
  end
  
  scenario "successfully in the summary" do
    expect(page).to have_content "Magic Stick"
  end

  scenario "with the project details" do
    click_link "Magic Stick"

    expect(page.current_url).to eq item_url(item)
  end
end
