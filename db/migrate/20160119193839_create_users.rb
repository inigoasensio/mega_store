class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.integer :phone
      t.boolean :supplier, default: false
      t.attachment :avatar

      t.timestamps
    end
  end
end
