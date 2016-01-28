class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :tracking_number
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity
      t.decimal :discount
      t.decimal :total, precision: 5, scale: 2
      t.string :currency
      t.string :size
      t.string :color
      t.string :status

      t.timestamps
    end
  end
end
