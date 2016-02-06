class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :unit_quantity
      t.decimal :unit_price, precision: 5, scale: 2
      t.attachment :image
      t.references :category
      t.references :supplier

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :supplier_id
  end
end
