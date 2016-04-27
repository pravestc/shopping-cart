class AddTotalpriceToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :totalprice, :integer
  end
end
