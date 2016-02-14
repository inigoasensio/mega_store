class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :tracking_number
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity
      t.decimal :discount
      t.decimal :total, precision: 5, scale: 2
      t.string :currency
      t.integer :freight
      t.string :size
      t.string :color
      t.string :status
      t.references :order
      t.references :product

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :product_id
  end
end
