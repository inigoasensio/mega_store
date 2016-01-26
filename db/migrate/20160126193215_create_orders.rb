class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :tracking_number
      t.datetime :order_date
      t.datetime :ship_date
      t.integer :status
      t.integer :freight
      t.decimal :sales_tax
      t.references :order
      t.references :user

      t.timestamps
    end
    add_index :orders, :order_id
    add_index :orders, :user_id
  end
end
