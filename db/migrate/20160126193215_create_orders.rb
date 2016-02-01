class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.datetime :ship_date
      t.integer :status
      t.decimal :sales_tax
      t.references :user
      t.references :shipper

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :shipper_id
  end
end
