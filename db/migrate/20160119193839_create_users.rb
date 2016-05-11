class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.boolean :supplier, default: false
      t.boolean :admin, default: false
      t.boolean :super_admin, default: false
      t.string :braintree_customer_id
      t.attachment :avatar

      t.timestamps
    end
  end
end
