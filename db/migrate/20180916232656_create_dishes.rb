class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.string :recipe
      t.text :recipe_url
      t.integer :base_servings, null: false

      t.timestamps
    end
  end
end
