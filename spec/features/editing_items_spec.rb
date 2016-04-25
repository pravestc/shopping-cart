require "rails_helper"

RSpec.feature "Shopkeepers can edit items" do
  before do
    FactoryGirl.create(:item, name: "Ring of Protection")
  end
end    
