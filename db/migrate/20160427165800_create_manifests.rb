class CreateManifests < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :item, index: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
