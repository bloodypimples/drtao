# create product cateories
@product_categories = ["iPhone mới", "iPhone cũ", "Thay màn hình", "Sửa MacBook", "Sửa iPad", "Sửa iPhone", "Ép kính iPhone"]

@product_categories.each do |category|
  Category.create(name: category, for: "Products")
end

# create service categories
@service_categories = ["Sửa iPhone", "Sửa iPad", "Sửa MacBook", "Ép Kính iPhone", "Sửa Blackberry", "Sửa Phillips", "Sửa Samsung"]

@service_categories.each do |category|
  Category.create(name: category, for: "Services")
end

# create part categories
@part_categories = ["Linh Kiện iPhone", "Linh Kiện iPad", "Linh Kiện MacBook", "Linh Kiện Blackberry", "Linh Kiện Phillips", "Linh Kiện Samsung", "Linh Kiện iMac"]

@part_categories.each do |category|
  Category.create(name: category, for: "Parts")
end

# create admins
User.create(
  email: "hieudoan2609@gmail.com",
  password: "secret",
  password_confirmation: "secret"
)

50.times do
  # create products
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(1..7),
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )

  # create services
  Service.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(8..14),
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )

  # create parts
  Part.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(15..21),
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )

  # create articles
  Article.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(5),
    user_id: 1,
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )
end
