@product_categories = ["iPhone mới", "iPhone cũ", "Thay màn hình", "Sửa MacBook", "Sửa iPad", "Sửa iPhone", "Ép kính iPhone"]

@product_categories.each do |category|
  Category.create(name: category, for: "Products")
end

User.create(
  email: "hieudoan2609@gmail.com",
  password: "secret",
  password_confirmation: "secret"
)

200.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: '$ ' + Faker::Commerce.price.to_s,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(1..7)
  )

  Article.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(5),
    user_id: 1,
    body: 'BODY HTML CONTENT'
  )
end
