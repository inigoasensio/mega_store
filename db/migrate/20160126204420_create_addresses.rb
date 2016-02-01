class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address1
      t.text :address2
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country
      t.string :address_type
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
