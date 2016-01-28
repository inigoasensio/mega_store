class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.references :subcategories

      t.timestamps
    end
  end
end
