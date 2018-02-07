# create admins
User.create(
  email: "hieudoan2609@gmail.com",
  name: "Hieu",
  password: "secret",
  password_confirmation: "secret"
)

# create super categories & categories
types = ['Products', 'Services', 'Parts']
50.times do

  sup = SuperCategory.create(
    name: Faker::Lorem.sentence(3),
    for: types[rand(0..2)]
  )

  rand(1..5).times do
    sup.categories.create(
      name: Faker::Lorem.sentence(3)
    )
  end
end

#create products
100.times do
  product = Product.new(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(1..Category.count),
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )
  while product.category.for != "Products" do
    product.category_id = rand(1..Category.count)
  end
  product.save

  # create services
  service = Service.new(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(1..Category.count),
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )
  while service.category.for != "Services" do
    service.category_id = rand(1..Category.count)
  end
  service.save

  # create parts
  part = Part.new(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(5),
    category_id: rand(1..Category.count),
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )
  while part.category.for != "Parts" do
    part.category_id = rand(1..Category.count)
  end
  part.save
end

# create articles
10.times do
  Article.create(
    title: Faker::Lorem.sentence.tr('.', ''),
    description: Faker::Lorem.paragraph(5),
    user_id: 1,
    body: Faker::Lorem.paragraphs(rand(5..10), true).join('<br><br>')
  )
end
