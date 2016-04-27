class RemoveTotapriceFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :totaprice, :integer
  end
end
