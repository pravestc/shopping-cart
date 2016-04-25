class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :legend
      t.text :effect
      t.text :stats

      t.timestamps null: false
    end
  end
end
