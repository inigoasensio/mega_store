class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :status
      t.string :purchase_type
      t.datetime :date
      t.references :user
      t.references :credit_card
      t.references :order

      t.timestamps
    end
    add_index :purchases, :user_id
    add_index :purchases, :credit_card_id
    add_index :purchases, :order_id
  end
end
