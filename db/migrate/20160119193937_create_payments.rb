class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :status
      t.integer :payment_type
      t.datetime :date

      t.timestamps
    end
  end
end
