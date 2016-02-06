# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all

products = [
  { name: 'Computer', unit_price: 599.99, description: 'computer', unit_quantity: 1, image: File.open("#{Rails.root}/app/assets/images/default_product.png") },
  { name: 'Tablet', unit_price: 99.99, description: 'tablet', unit_quantity: 7, image: File.open("#{Rails.root}/app/assets/images/default_product.png") },
  { name: 'Smartphone', unit_price: 399.99, description: 'smartphone', unit_quantity: 4, image: File.open("#{Rails.root}/app/assets/images/default_product.png") },
  { name: 'Camera', unit_price: 49.99, description: 'camera', unit_quantity: 2, image: File.open("#{Rails.root}/app/assets/images/default_product.png") }
]

products.each do |product|
  Product.create!(product)
  puts "product #{product[:name]} seed data generated"
end
