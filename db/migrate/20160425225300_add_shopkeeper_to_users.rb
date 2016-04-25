class AddShopkeeperToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shopkeeper, :boolean, default: false
  end
end
