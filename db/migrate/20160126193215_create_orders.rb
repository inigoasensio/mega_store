class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.string :status
      t.datetime :shipping_date
      t.string :shipping_status
      t.integer :tracking_number
      t.decimal :sales_tax

      t.references :user
      t.references :shipper

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :shipper_id
  end
end
