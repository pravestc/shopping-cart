require "rails_helper"

RSpec.feature "Users can place orders" do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item, name: "Radiance") }

  before do
    visit item_path(item)
    click_link "Add item to cart"
    click_link "Go to cart"
  end
  
  scenario "when logged in" do
    login_as(user)
    click_link "Place Order"

    expect(page).to have_content "Order has been placed. Your cart has been emptied so you can place another order"
  end

  scenario "but not when not logged in" do
    click_link "Place Order"

    expect(page).to have_content "Order has not been placed. Please log in first"
  end
end
