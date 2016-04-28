require "rails_helper"

RSpec.feature "Users can remove items from cart" do
  let!(:item)  { FactoryGirl.create(:item, name: "Radiance") }

  before do
    visit item_path(item)
    click_link "Add item to cart"
  end

  scenario "successfully" do
    click_link "Remove item from cart"

    expect(page).to have_content "Radiance has been removed from cart"
    click_link "Go to cart"
    expect(page).to_not have_content item.name
    expect(page).to have_content "Current Cart"
  end
end
