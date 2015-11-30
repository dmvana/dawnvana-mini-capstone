class CreateCatergorizedProducts < ActiveRecord::Migration
  def change
    create_table :catergorized_products do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
