class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, :precision => 5, :scale => 2
      t.text :description
      t.references :supplier
      t.references :user
      t.references :department

      t.timestamps
    end
    add_index :items, :supplier_id
    add_index :items, :user_id
    add_index :items, :department_id
  end
end
