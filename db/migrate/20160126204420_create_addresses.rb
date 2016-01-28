class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address1
      t.text :address2
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
