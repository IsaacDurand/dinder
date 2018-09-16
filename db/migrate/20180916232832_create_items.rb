class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.decimal :quantity, null: false
      t.references :unit, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
