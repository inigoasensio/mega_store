class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :tracking_number
      t.decimal :price
      t.integer :quantity
      t.decimal :discount
      t.decimal :total
      t.integer :currency
      t.integer :size
      t.integer :color
      t.integer :status

      t.timestamps
    end
  end
end
