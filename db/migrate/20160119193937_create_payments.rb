class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :status
      t.string :payment_type
      t.datetime :date
      t.references :user
      t.references :credit_card

      t.timestamps
    end
    add_index :payments, :user_id
    add_index :payments, :credit_card_id
  end
end
