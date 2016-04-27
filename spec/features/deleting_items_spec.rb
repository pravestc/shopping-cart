require "rails_helper"

RSpec.feature "Shopkeeper can delete items" do
  let!(:item) { FactoryGirl.create(:item, name: "Ring of Protection") } 
 
  before do
    login_as(FactoryGirl.create(:user, :shopkeeper))
    visit "/"
    click_link "Ring of Protection"
  end

  scenario "successfully from the item page" do
    click_link "Delete Item"

    expect(page).to have_content "Item has been deleted."
    expect(page).to have_content "Welcome to the Secret Shop!"
    expect(page).to_not have_content "Ring of Protection"
  end
end
