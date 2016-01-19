class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.references :item

      t.timestamps
    end
    add_index :suppliers, :item_id
  end
end
