class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :sku
      t.integer :barcode
      t.integer :weight
      t.string :size
      t.string :color
      t.decimal :price, precision: 5, scale: 2
      t.date :voided_at
      t.attachment :image

      t.references :category
      t.references :supplier

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :supplier_id
  end
end
