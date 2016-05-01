require "rails_helper"

RSpec.feature "Users can only see appropiate link" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shopkeeper) { FactoryGirl.create(:user, :shopkeeper) }
  let!(:item) { FactoryGirl.create(:item, name: "Radiance") }

  context "anonymous users" do
    before { visit "/" }
    scenario "cannot see New Item link and Go to placed orders" do
      expect(page).not_to have_link "New Item"
      expect(page).not_to have_link "Go to placed orders"
      expect(page).to have_link "Go to cart"
    end

    scenario "cannot see the Delete Item link" do
      click_link "Radiance"
      expect(page).not_to have_link "Delete Item"
      expect(page).not_to have_link "Edit Item"
      expect(page).to have_link "Add item to cart"
      expect(page).to have_link "Remove item from cart"
      expect(page).to have_link "Go to cart"
      expect(page).to have_link "Go back to item list"
    end


  end

  context "regular users" do
    before do
      login_as(user) 
      visit "/"
    end

    scenario "cannot see the New Item link" do
      expect(page).not_to have_link "New Item"
      expect(page).to have_link "Go to placed orders"
      expect(page).to have_link "Go to cart"
    end

    scenario "cannot see the Delete Item link" do
      click_link "Radiance"
      expect(page).not_to have_link "Delete Item"
      expect(page).not_to have_link "Edit Item"
      expect(page).to have_link "Add item to cart"
      expect(page).to have_link "Remove item from cart"
      expect(page).to have_link "Go to cart"
      expect(page).to have_link "Go back to item list"
    end
  end

  context "shopkeepers" do
    before do
      login_as(shopkeeper)
      visit "/"
    end

    scenario "Cannot see the Go to placed orders or Go to cart links" do
      expect(page).to have_link "New Item"
      expect(page).not_to have_link "Go to placed orders"
      expect(page).not_to have_link "Go to cart"
    end

    scenario "Cannot see the Add item to cart, Remove item from cart and Go to cart links" do
      click_link "Radiance"
      expect(page).to have_link "Delete Item"
      expect(page).to have_link "Edit Item"
      expect(page).not_to have_link "Add item to cart"
      expect(page).not_to have_link "Remove item from cart"
      expect(page).not_to have_link "Go to cart"
      expect(page).to have_link "Go back to item list"
    end
  end
end
