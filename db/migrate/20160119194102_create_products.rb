class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.references :supplier
      t.string :name
      t.text :description
      t.attachment :image
      t.integer :unit_quantity
      t.decimal :unit_price, precision: 5, scale: 2
      t.date :voided_at

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :supplier_id
  end
end
