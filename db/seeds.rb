# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@categories = ["iPhone mới", "iPhone cũ", "Thay màn hình", "Sửa MacBook", "Sửa iPad", "Sửa iPhone", "Ép kính iPhone"]

@categories.each do |category|
  Category.create(name: category)
end

200.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: '$ ' + Faker::Commerce.price.to_s,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(1..7)
  )
end
