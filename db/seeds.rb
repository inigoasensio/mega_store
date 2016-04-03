# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all

products = [
  { id: 1, name: 'Computer', price: 599.99, description: 'computer', category_id: 2 },
  { id: 2, name: 'Tablet', price: 99.99, description: 'tablet', category_id: 1 },
  { id: 3, name: 'Smartphone', price: 399.99, description: 'smartphone', category_id: 3 },
  { id: 4, name: 'Camera', price: 49.99, description: 'camera', category_id: 1 }
]

products.each do |product|
  Product.create!(product)
  puts "product #{product[:name]} seed data generated"
end

categories = [
  { name: 'Electronics' },
  { name: 'Computer', parent_id: 1 },
  { name: 'Smartphone', parent_id: 1 },
  { name: 'Food' },
  { name: 'Sandwich', parent_id: 4 },
  { name: 'Pasta', parent_id: 4 },
  { name: 'Clothes' }
]

categories.each do |category|
  Category.create!(category)
  puts "category #{category[:name]} seed data generated"
end
