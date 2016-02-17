class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :cardholder_name
      t.integer :number
      t.integer :cvv
      t.date :expiration_month
      t.date :expiration_year
      t.date :expiration_date
      t.integer :card_type
      t.string :country_of_issuance
      t.integer :issuing_bank
      t.boolean :debit
      t.boolean :prepaid
      t.string :options
      t.integer :token
      t.references :user
      t.references :purchase

      t.timestamps
    end
    add_index :credit_cards, :user_id
    add_index :credit_cards, :purchase_id
  end
end
