class AddCartToItems < ActiveRecord::Migration
  def change
    add_reference :items, :cart, index: true, foreign_key: true
  end
end
