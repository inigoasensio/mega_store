class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.datetime :expected_date
      t.string :status

      t.references :product

      t.timestamps null: false
    end
    add_index :transfers, :product_id
  end
end
