class AddTotalpriceToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :totaprice, :integer
  end
end
