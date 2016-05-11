class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :status
      t.integer :quantity
      t.decimal :unit_price, precision: 5, scale: 2
      t.decimal :total_price, precision: 5, scale: 2
      t.string :currency
      t.decimal :discount
      t.integer :freight
      t.integer :length
      t.integer :width
      t.integer :height

      t.references :order
      t.references :product

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :product_id
  end
end
