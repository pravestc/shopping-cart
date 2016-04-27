require "rails_helper"

RSpec.feature "Users can add items to cart" do
  let!(:item) { FactoryGirl.create(:item, name: "Radiance") }
  let!(:item2) { FactoryGirl.create(:item, name: "Courier") }
  before do
    visit "/"
    click_link "Radiance"
    click_link "Add item to cart"
  end

  scenario "successfully without being logged in" do
    expect(page).to have_content "Radiance has been added to cart."
    expect(page.current_url).to eq item_url(item)
    click_link "Home"
    click_link "Courier"
    click_link "Add item to cart"

    expect(page).to have_content "Courier has been added to cart."

    click_link "Go to cart"

    expect(page).to have_content "Radiance"
    expect(page).to have_content "Courier"
    expect(page).to have_content "This is your cart"
  end
end
