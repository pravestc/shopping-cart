require "rails_helper"

RSpec.feature "Users can place orders" do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item, name: "Radiance") }
  
  scenario "when logged in" do
    visit item_path(item)
    click_link "Add item to cart"
    click_link "Go to cart"
    login_as(user)
    click_link "Place Order"

    expect(page).to have_content "Order has been placed. Your cart has been emptied so you can place another order"
  end

  scenario "but not when not logged in" do
    visit item_path(item)
    click_link "Add item to cart"
    click_link "Go to cart"
    click_link "Place Order"

    expect(page).to have_content "Order has not been placed. Please log in first"
  end

  scenario "but not when cart is empty" do
    visit "/"
    click_link "Go to cart"
    login_as(user)
    click_link "Place Order"

    expect(page).to have_content "Order has not been placed. Cart is empty. Please select one or more items before placing your order"
    expect(page.current_url).to eq items_url
  end
end
