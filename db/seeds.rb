# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all

products = [
  { id: 1, name: 'Computer', price: 599.99, description: 'computer' },
  { id: 2, name: 'Tablet', price: 99.99, description: 'tablet' },
  { id: 3, name: 'Smartphone', price: 399.99, description: 'smartphone' },
  { id: 4, name: 'Camera', price: 49.99, description: 'camera' }
]

products.each do |product|
  Product.create!(product)
  puts "product #{product[:name]} seed data generated"
end

categories = [
  { name: 'Electronics' },
  { name: 'Computer' },
  { name: 'Smartphone' },
  { name: 'Food' },
  { name: 'Clothes' }
]

categories.each do |category|
  Category.create!(category)
  puts "category #{category[:name]} seed data generated"
end
